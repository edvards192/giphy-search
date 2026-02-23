// Main search screen:
// captures query input
// renders UI states (idle/loading/failure/results)
// shows results in a responsive grid with infinite scroll pagination
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_bloc.dart';
import '../bloc/main_event.dart';
import '../bloc/main_state.dart';
import '../data/models/gif_model.dart';
import 'inspect_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key,});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Controller for detecting near-bottom scroll and requesting more data
  final _scrollController = ScrollController();
  // Controller keeps current search text and lets us dispose resources
  final _searchController = TextEditingController();

  // Trigger loading next page before reaching the absolute bottom
  static const _loadMoreThresholdPx = 500.0;

  @override
  void initState() {
    super.initState();
    // Monitors scroll position and triggers loading more results.
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // removes controllers to avoid memory leaks
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final max = _scrollController.position.maxScrollExtent; // maximum scroll offset
    final cur = _scrollController.position.pixels; // current scroll offset

    // Ask BLoC for next page when user gets close enough to the end.
    if (max - cur <= _loadMoreThresholdPx) {
      context.read<MainBloc>().add(const LoadMoreRequested());
    }
  }

  void _openInspect(GifModel gif) {
    // Open inspect page for the selected GIF.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => InspectPage(gif: gif),
      ),
    );
  }

  int _crossAxisCountForWidth(double width) {
    // picks column count for different screen widths
    if (width < 500) return 2;
    if (width < 900) return 3;
    return 4;
  }
  
  @override
  Widget build(BuildContext context) {
    // In landscape hidden appbar
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: isLandscape ? null : AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.gif_box_outlined, size: 32),
            SizedBox(width: 8),
            Text('Giphy Search'),
          ],
        ),
        centerTitle: true,
        elevation: 2,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              child: TextField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: 'Search GIFs…',
                  hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    ),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  context.read<MainBloc>().add(QueryChanged(text));
                },
              ),
            ),
            Expanded(
              child: BlocConsumer<MainBloc, MainState>(
                // Shows snackbar only for non-fatal errors
                listenWhen: (prev, next) =>
                    prev.errorMessage != next.errorMessage &&
                    next.errorMessage != null &&
                    next.status != MainStatus.failure,
                listener: (context, state) {
                  final msg = state.errorMessage;
                  if (msg != null && msg.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(msg)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.status == MainStatus.idle) {
                    // Initial prompt before user starts searching.
                    return const Center(
                      child: Text('Start typing to search GIFs',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      )
                      ),
                    );
                  }

                  if (state.status == MainStatus.loading) {
                    // loader for first page request.
                    return const Center(
                      child: CircularProgressIndicator(), 
                    );
                  }

                  if (state.status == MainStatus.failure) {
                    // error message
                    return _ErrorView(
                      message: state.errorMessage ?? 'Something went wrong',
                      onRetry: () => context
                          .read<MainBloc>()
                          .add(const RetryRequested()), // dispacth retry event to bloc
                    );
                  }

                  if (state.items.isEmpty) {
                    // Search completed but returned no items.
                    return const Center(child: Text('No results',
                    style: TextStyle(
                      fontSize: 18,
                    )
                    ));
                  }
                  // Successful results - gets screen width and picks number of columns
                  final width = MediaQuery.sizeOf(context).width;
                  final crossAxisCount = _crossAxisCountForWidth(width);

                return Stack(
                  children: [
                    // Results grid
                    GridView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        childAspectRatio: 1,
                      ),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        // Each tile shows preview image and navigates to details
                        final gif = state.items[index];

                        return _GifTile(
                          gif: gif,
                          onTap: () => _openInspect(gif),
                        );
                      },
                    ),

                    // Non-blocking bottom loader while keeping current items visible.
                    if (state.status == MainStatus.loadingMore)
                      const Positioned(
                        bottom: 16,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GifTile extends StatelessWidget {
  const _GifTile({
    required this.gif,
    required this.onTap,
  });

  final GifModel gif;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Tile with preview image and tap handler to open details page
    return Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        child: Ink.image(
          image: NetworkImage(gif.previewUrl),
          // ensures that image covers full tile.
          fit: BoxFit.cover,
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    // Simple retry when search fails
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onRetry, // dispatches a retry event to the bloc
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
