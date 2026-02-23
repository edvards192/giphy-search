import 'package:equatable/equatable.dart';
import '../data/models/gif_model.dart';

enum MainStatus {
  idle,        // no search yet
  loading,     // first page loading
  success,     // results loaded
  loadingMore, // next page loading
  failure,     // error occurred
}

class MainState extends Equatable {
  final String query; // current search text
  final List<GifModel> items; // all loaded GIFs matching the query, later new items can be appended
  final MainStatus status;
  final String? errorMessage;

  final int offset;   // pagination offset for next request
  final bool hasMore; // whether we should try loading more

  const MainState({
    required this.query,
    required this.items,
    required this.status,
    required this.offset,
    required this.hasMore,
    this.errorMessage,
  });

  // constructor for the initial state of the app.
  factory MainState.initial() => const MainState(
        query: '',
        items: [],
        status: MainStatus.idle,
        offset: 0,
        hasMore: false,
        errorMessage: null,
      );

   // Creates a new immutable state with updated fields, unspecified values keep the current state.
  MainState copyWith({
    String? query,
    List<GifModel>? items,
    MainStatus? status,
    String? errorMessage,
    int? offset,
    bool? hasMore,
  }) {
    return MainState(
      query: query ?? this.query,
      items: items ?? this.items,
      status: status ?? this.status,
      errorMessage: errorMessage,
      offset: offset ?? this.offset,
      hasMore: hasMore ?? this.hasMore,
    );
  }

  @override
  // Fields used for value equality, state changes trigger updates only when these differ
  List<Object?> get props => [
        query,
        items,
        status,
        errorMessage,
        offset,
        hasMore,
      ];
}
