import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_app/data/giphy_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'dart:io';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('GiphyRepository.search', () {
    late MockHttpClient client;
    late GiphyRepository repository;

    setUpAll(() {
      // Required by mocktail for Uri-typed arguments matched with any().
      registerFallbackValue(Uri.parse('https://example.com'));
    });

    setUp(() {
      client = MockHttpClient();
      // Repository under test with injected mock HTTP client.
      repository = GiphyRepository(apiKey: 'test-key', client: client);
    });

    // Tests successful request flow:
    // HTTP 200 response is parsed and mapped correctly,
    // outgoing query parameters are built as expected.
    test('returns mapped GifModel list on HTTP 200', () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response(
          '''
{
  "data": [
    {
      "id": "abc123",
      "title": "Funny cat",
      "images": {
        "fixed_width": {"url": "https://img.example/fixed.gif"},
        "downsized": {"url": "https://img.example/downsized.gif"},
        "original": {"url": "https://img.example/original.gif"}
      },
      "user": {"username": "cat_user"},
      "rating": "pg"
    }
  ]
}
''',
          200,
          reasonPhrase: 'OK',
        ),
      );

      final result = await repository.search(query: 'cats', offset: 0);

      expect(result, hasLength(1));
      expect(result.first.id, 'abc123');
      expect(result.first.title, 'Funny cat');
      expect(result.first.previewUrl, 'https://img.example/fixed.gif');
      expect(result.first.originalUrl, 'https://img.example/original.gif');
      expect(result.first.username, 'cat_user');
      expect(result.first.rating, 'pg');

      final captured = verify(() => client.get(captureAny())).captured.single as Uri;
      expect(captured.path, '/v1/gifs/search');
      expect(captured.queryParameters['api_key'], 'test-key');
      expect(captured.queryParameters['q'], 'cats');
      expect(captured.queryParameters['offset'], '0');
      expect(captured.queryParameters['limit'], '${GiphyRepository.pageSize}');
    });

    // Tests JSON parsing error handling by simulating an invalid JSON response.
    test('throws FormatException on invalid JSON response', () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response(
          '{not-valid-json',
          200,
          reasonPhrase: 'OK',
        ),
      );

      expect(
        () => repository.search(query: 'cats', offset: 0),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            'Invalid JSON response from Giphy API',
          ),
        ),
      );
    });

    // Tests HTTP status validation for non-200 responses.
    test('throws HttpException on non-200 response', () async {
      when(() => client.get(any())).thenAnswer(
        (_) async => http.Response(
          'Server error',
          500,
          reasonPhrase: 'Internal Server Error',
        ),
      );

      expect(
        () => repository.search(query: 'cats', offset: 0),
        throwsA(
          isA<HttpException>().having(
            (e) => e.message,
            'message',
            'Giphy API request failed: 500 Internal Server Error',
          ),
        ),
      );
    });
  });
}
