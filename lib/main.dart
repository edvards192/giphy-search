import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'giphy_keys.dart';
import 'data/giphy_repository.dart';
import 'bloc/main_bloc.dart';
import 'services/connectivity_service.dart';
import 'app_shell.dart';

void main() async {
  // Required before any async/setup work
  WidgetsFlutterBinding.ensureInitialized();
  final repo = GiphyRepository(apiKey: GiphyKeys.current); // Single repository instance
  final connectivityService = ConnectivityService(); // Creates connectivity service dynamic network monitoring

  runApp(
    MainApp(
      repo: repo,
      connectivityService: connectivityService,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.repo, required this.connectivityService,});

  final GiphyRepository repo; // DI via constructor
  final ConnectivityService connectivityService; // Connectivity service passed down to the app shell

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // One instance MainBloc for the full main page lifecycle, with injected repository.
      create: (_) => MainBloc(repository: repo),
      child: AppShell(
        connectivityService: connectivityService,
      ),
    );
  }
}
