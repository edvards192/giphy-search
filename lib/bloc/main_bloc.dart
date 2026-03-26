import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_event.dart';
import 'main_state.dart';
import '../data/giphy_repository.dart';

// Main BLoC for GIF search page:
// reacts to query changes with debounce
// loads first page and paginated pages

// Internal event used to fire the API call after debounce.
class _SearchRequested extends MainEvent {
  final String query;
  const _SearchRequested(this.query);

  @override
  List<Object?> get props => [query];
}

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required GiphyRepository repository,
    Duration debounce = const Duration(milliseconds: 350),
  })  : _repo = repository, // repository injected and stored
        _debounceDuration = debounce,
        super(MainState.initial()) { // sets initial state of the app (idle,empty list, etc.)
    // wires each event to a handler method
    on<QueryChanged>(_onQueryChanged);
    on<_SearchRequested>(_onSearchRequested);
    on<LoadMoreRequested>(_onLoadMoreRequested);
    on<RetryRequested>(_onRetryRequested);
  }
  // 
  final GiphyRepository _repo;
  // how long before making API call
  final Duration _debounceDuration;

  // active timer instance
  Timer? _debounceTimer;
  // cancel timer when bloc is closed to avoid memory leaks
  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }

  void _onQueryChanged(QueryChanged event, Emitter<MainState> emit) {
    final q = event.query;

    // Update query immediately so UI reflects it
    emit(
      state.copyWith(
        query: q,
        // Clear any prior error on new typing
        errorMessage: null,
      ),
    );

    _debounceTimer?.cancel(); // cancel timer if user keeps typing

    // If user cleared the search box, reset to idle state
    if (q.trim().isEmpty) {
      emit(MainState.initial());
      return;
    }

    _debounceTimer = Timer(_debounceDuration, () {
      // After debounce duration, fire the internal search event to trigger API call
      add(_SearchRequested(q));
    });
  }

  Future<void> _onSearchRequested(
    _SearchRequested event,
    Emitter<MainState> emit,
  ) async {
    final q = event.query.trim(); // prevents accidental searches with whitespace
    if (q.isEmpty) {
      emit(MainState.initial());
      return;
    }

    // Fresh search always resets list and pagination.
    emit(
      state.copyWith(
        query: q,
        status: MainStatus.loading,
        items: const [],
        offset: 0,
        hasMore: false,
        errorMessage: null,
      ),
    );

    try {
      // First page request starts at offset 0
      final items = await _repo.search(query: q, offset: 0);

      emit(
        state.copyWith(
          status: MainStatus.success,
          items: items,
          // Next page starts after currently loaded items
          offset: items.length,
          // If page is full, assume there may be more
          hasMore: items.length == GiphyRepository.pageSize,
        ),
      );
    } catch (e) {
      final msg = e.toString().contains('SocketException')
          ? 'Network error. Please check your connection.'
          : 'Failed to load GIFs. Please try again.';
      emit(
        state.copyWith(
          status: MainStatus.failure,
          errorMessage: msg,
        ),
      );
    }
  }
  // triggered by UI scroll near bottom
  Future<void> _onLoadMoreRequested(
    LoadMoreRequested event,
    Emitter<MainState> emit,
  ) async {
    // Safety check
    if (state.query.trim().isEmpty) return; // empty query
    if (!state.hasMore) return; // no more pages
    if (state.status == MainStatus.loading || state.status == MainStatus.loadingMore) return; // already loading

    // Keep current grid visible and show bottom loader in UI
    emit(state.copyWith(status: MainStatus.loadingMore, errorMessage: null));

    try {
      final next = await _repo.search( // next page
        query: state.query,
        offset: state.offset,
      );

      // Append new page items to existing items.
      final combined = List.of(state.items)..addAll(next);

      emit( // Updated success state
        state.copyWith(
          status: MainStatus.success,
          items: combined,
          offset: state.offset + next.length,
          // Continue paginating only when page is full-size
          hasMore: next.length == GiphyRepository.pageSize,
        ),
      );
    } catch (e) {
        final msg = e.toString().contains('SocketException')
      ? 'Network error. Please check your connection.'
      : 'Failed to load more GIFs. Please try again.';
      // Keeps existing items, just surface error and return to success so UI doesn't blank out
      emit(
        state.copyWith(
          status: MainStatus.success,
          errorMessage: msg, // snackbar message in UI
        ),
      );
    }
  }
  // repeat last search
  Future<void> _onRetryRequested(
    RetryRequested event,
    Emitter<MainState> emit,
  ) async {
    final q = state.query.trim();
    if (q.isEmpty) {
      emit(MainState.initial());
      return; // if nothing to search, reset to initial state
    }
    // Re-run the same query
    add(_SearchRequested(q));
  }
}
