import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giphy_app/bloc/main_bloc.dart';
import 'package:giphy_app/bloc/main_event.dart';
import 'package:giphy_app/bloc/main_state.dart';
import 'package:giphy_app/data/giphy_repository.dart';
import 'package:giphy_app/data/models/gif_model.dart';
import 'package:mocktail/mocktail.dart';

class MockGiphyRepository extends Mock implements GiphyRepository {}

void main() {
  group('MainBloc', () {
    late MockGiphyRepository repository;
    // Shared data used by tests as first-page search results
    final items = <GifModel>[
      const GifModel(
        id: '1',
        title: 'Cat 1',
        previewUrl: 'https://example.com/cat1_preview.gif',
        originalUrl: 'https://example.com/cat1_original.gif',
        username: 'user1',
        rating: 'g',
      ),
      const GifModel(
        id: '2',
        title: 'Cat 2',
        previewUrl: 'https://example.com/cat2_preview.gif',
        originalUrl: 'https://example.com/cat2_original.gif',
        username: 'user2',
        rating: 'pg',
      ),
    ];

    setUp(() {
      repository = MockGiphyRepository();
      // Default repository behavior for search
      when(
        () => repository.search(
          query: any(named: 'query'),
          offset: any(named: 'offset'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => items);
    });

    // Tests QueryChanged, debounce, first-page search flow.
    // Verifies state sequence and that repository is called exactly once.
    blocTest<MainBloc, MainState>(
      'emits query update, then loading and success after debounce',
      build: () => MainBloc(
        repository: repository,
        debounce: const Duration(milliseconds: 10),
      ),
      act: (bloc) => bloc.add(const QueryChanged('cats')),
      wait: const Duration(milliseconds: 40),
      expect: () => [
        isA<MainState>()
            .having((s) => s.query, 'query', 'cats')
            .having((s) => s.status, 'status', MainStatus.idle)
            .having((s) => s.errorMessage, 'errorMessage', null),
        isA<MainState>()
            .having((s) => s.query, 'query', 'cats')
            .having((s) => s.status, 'status', MainStatus.loading)
            .having((s) => s.items, 'items', isEmpty)
            .having((s) => s.offset, 'offset', 0)
            .having((s) => s.hasMore, 'hasMore', false),
        isA<MainState>()
            .having((s) => s.query, 'query', 'cats')
            .having((s) => s.status, 'status', MainStatus.success)
            .having((s) => s.items.length, 'items.length', 2)
            .having((s) => s.offset, 'offset', 2)
            .having((s) => s.hasMore, 'hasMore', false),
      ],
      verify: (_) {
        verify(
          () => repository.search(
            query: 'cats',
            offset: 0,
            limit: any(named: 'limit'),
          ),
        ).called(1);
      },
    );

    // Tests LoadMoreRequested pagination flow from an existing success state.
    // Verifies loadingMore state, append behavior, offset update, and hasMore recalculation.
    blocTest<MainBloc, MainState>(
      'emits loadingMore then success and appends items on LoadMoreRequested',
      build: () {
        when(
          () => repository.search(
            query: 'cats',
            offset: 2,
            limit: any(named: 'limit'),
          ),
        ).thenAnswer(
          (_) async => const <GifModel>[
            GifModel(
              id: '3',
              title: 'Cat 3',
              previewUrl: 'https://example.com/cat3_preview.gif',
              originalUrl: 'https://example.com/cat3_original.gif',
              username: 'user3',
              rating: 'pg-13',
            ),
          ],
        );

        return MainBloc(
          repository: repository,
          debounce: const Duration(milliseconds: 10),
        );
      },
      seed: () => MainState(
        query: 'cats',
        items: items,
        status: MainStatus.success,
        offset: 2,
        hasMore: true,
        errorMessage: null,
      ),
      act: (bloc) => bloc.add(const LoadMoreRequested()),
      expect: () => [
        isA<MainState>()
            .having((s) => s.status, 'status', MainStatus.loadingMore)
            .having((s) => s.errorMessage, 'errorMessage', null),
        isA<MainState>()
            .having((s) => s.status, 'status', MainStatus.success)
            .having((s) => s.items.length, 'items.length', 3)
            .having((s) => s.offset, 'offset', 3)
            .having((s) => s.hasMore, 'hasMore', false),
      ],
      verify: (_) {
        verify(
          () => repository.search(
            query: 'cats',
            offset: 2,
            limit: any(named: 'limit'),
          ),
        ).called(1);
      },
    );
  });
}
