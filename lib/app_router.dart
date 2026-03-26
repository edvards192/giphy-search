import 'package:go_router/go_router.dart';
import '../data/models/gif_model.dart';
import '../views/inspect_page.dart';
import '../views/main_page.dart';

// Defines all routes in one place

class AppRoutes {
  static const home = '/';
  static const inspect = '/inspect';
}

// Main router configuration using go_router
final GoRouter appRouter = GoRouter(
  routes: [
    // For home page
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const MainPage(),
    ),
    // For inspect page
    GoRoute(
      path: AppRoutes.inspect,
      builder: (context, state) {
        // Gets GifModel from navigation arguments
        final gif = state.extra! as GifModel;
        // builds with specified GIF data
        return InspectPage(gif: gif);
      },
    ),
  ],
);