import 'package:equatable/equatable.dart';
// Defines the only ways UI can interact with BLoC business logic.
abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}
// search query text changed - triggered on every keystroke, but BLoC will debounce it before making API calls.
class QueryChanged extends MainEvent {
  final String query;

  const QueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}
// When user scrolls near bottom, this event is triggered to load next page of results
class LoadMoreRequested extends MainEvent {
  const LoadMoreRequested();
}

class RetryRequested extends MainEvent {
  const RetryRequested();
}