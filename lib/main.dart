import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'giphy_keys.dart';
import 'data/giphy_repository.dart';
import 'views/main_page.dart';
import 'bloc/main_bloc.dart';

void main() async{
  // Required before any async/setup work
  WidgetsFlutterBinding.ensureInitialized();
  // Single repository instance
  final repo = GiphyRepository(apiKey: GiphyKeys.current);

  runApp(MainApp(repo: repo));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.repo});
  final GiphyRepository repo; // DI via constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     home: BlocProvider(
        // One instance MainBloc for the full main page lifecycle, with injected repository.
        create: (_) => MainBloc(repository: repo),
        child: const MainPage(),
      ),
      theme: ThemeData(
        appBarTheme:  const AppBarTheme(
          backgroundColor: Color(0xFF04318C),
          foregroundColor: Colors.white,
        ),
      )
    );
  }
}
