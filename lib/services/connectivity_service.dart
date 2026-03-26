import 'package:connectivity_plus/connectivity_plus.dart';

// Service responsible for monitoring network connectivity
// Provides current status and real-time updates.
class ConnectivityService {
  ConnectivityService({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  // Checks current connectivity status
  Future<bool> get isConnected async {
    final results = await _connectivity.checkConnectivity();
    return _hasConnection(results);
  }

  // Emits connectivity updates in real time
  Stream<bool> get connectionStream {
    return _connectivity.onConnectivityChanged
        .map(_hasConnection) // converts results to boolean
        .distinct(); // prevents duplicates
  }
  // Determines if there is any active network connection
  bool _hasConnection(List<ConnectivityResult> results) {
    return results.isNotEmpty &&
        results.any((result) => result != ConnectivityResult.none);
  }
}