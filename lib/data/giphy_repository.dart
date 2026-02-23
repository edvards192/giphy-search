// Repository responsible for all Giphy API access:
// Performs GIF search requests (with pagination)
// Validates HTTP responses
// Parses JSON into API models
// Maps API models to app-level GifModel objects
// Returns UI-ready data or throws exceptions on failure
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'models/gif_model.dart';
import 'models/giphy_response.dart';

class GiphyRepository {
  GiphyRepository({
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client();

  // API key injected from app config
  final String apiKey;
  // Injectable client for testing
  final http.Client _client;

  static const String _baseUrl = 'https://api.giphy.com/v1/gifs';
  // Default page size
  static const int pageSize = 25;

  // Search for GIFs with the given query
  Future<List<GifModel>> search({
    required String query,
    required int offset,
    int limit = pageSize,
  }) async {
    // 1) Create request URI with query + pagination params.
    final uri = _buildSearchUri(query, offset, limit);
    // 2) Execute GET request.
    final response = await _client.get(uri);

    // 3) Fail fast if non-200 HTTP code.
    _validateResponse(response);

    // 4) Parse payload and map into app domain objects.
    final giphyResponse = _parseResponse(response.body); // JSON to GiphyResponse(DTO)
    return giphyResponse.data.map(_mapToGifModel).toList(); // DTO to Domain Model
  }

  // Build the search URI with query parameters
  Uri _buildSearchUri(String query, int offset, int limit) {
    return Uri.parse('$_baseUrl/search').replace(
      queryParameters: {
        'api_key': apiKey,
        'q': query,
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );
  }

  // Validate HTTP response status
  void _validateResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw HttpException(
        'Giphy API request failed: ${response.statusCode} ${response.reasonPhrase}',
      );
    }
  }

  // Parse JSON response into typed DTO
  GiphyResponse _parseResponse(String body) {
    try {
      final json = jsonDecode(body) as Map<String, dynamic>;
      return GiphyResponse.fromJson(json);
    } on FormatException {
      throw const FormatException('Invalid JSON response from Giphy API');
    } catch (e) {
      // unexpected parsing issues
      throw Exception('Failed to parse Giphy API response: $e');
    }
  }

  /// Map GiphyGif API model to our domain GifModel
  GifModel _mapToGifModel(GiphyGif gif) {
    return GifModel(
      id: gif.id,
      // API can return null/empty title; UI expects a non-null string
      title: gif.title ?? '',
      previewUrl: _extractPreviewUrl(gif.images),
      originalUrl: _extractOriginalUrl(gif.images),
      username: gif.user?.username,
      rating: gif.rating,
    );
  }

  // Extracts preview URL with fallback
  String _extractPreviewUrl(GiphyImages images) {
    // Prefer fixed-width for grid consistency
    return images.fixedWidth?.url ??
        images.downsized?.url ??
        images.original?.url ??
        '';
  }

  /// Extracts original URL with fallback
  String _extractOriginalUrl(GiphyImages images) {
    // Prefer original for details page quality
    return images.original?.url ?? 
        images.downsized?.url ??
        images.fixedWidth?.url ??
        '';
  }
}
