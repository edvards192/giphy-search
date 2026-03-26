import 'dart:async';
import 'package:flutter/material.dart';
import '../app_router.dart';
import '../services/connectivity_service.dart';

// Root app widget that sets up routing and listens for connectivity changes
class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.connectivityService,
  });

  // Service used to monitor connection changes
  final ConnectivityService connectivityService;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  // Key to show SnackBars from anywhere in the app
  final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  // Subscription to connectivity changes
  StreamSubscription<bool>? _subscription;
  // Stores the previous connectivity value to avoid duplicate snackbars
  bool? _lastKnownConnection;

  @override
  void initState() {
    super.initState();

    // Reads current connectivity state when the app starts
    widget.connectivityService.isConnected.then((connected) {
      _lastKnownConnection = connected;
    });
    // Listens to live connectivity changes and shows a snackbar when status changes
    _subscription = widget.connectivityService.connectionStream.listen((connected) {
      if (_lastKnownConnection == connected) return;
      _lastKnownConnection = connected;

      _messengerKey.currentState
        ?..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              connected
                  ? 'Internet connection restored'
                  : 'Network error. Please check your connection.',
            ),
          ),
        );
    });
  }
  // clears subscription to avoid memory leaks
  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter, // router configuration
      scaffoldMessengerKey: _messengerKey, // enables global snackbar display
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF04318C), 
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}