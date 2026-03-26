//  shows selected GIF preview, displays info, changes layout based on orientation
import 'package:flutter/material.dart';

import '../data/models/gif_model.dart';

class InspectPage extends StatelessWidget {
  const InspectPage({
    super.key,
    required this.gif,
  });

  final GifModel gif;

  @override
  Widget build(BuildContext context) {
    // builds only non-empty data rows
    final infoWidgets = <Widget>[
      if (gif.title.isNotEmpty) _InfoRow(label: 'Title', value: gif.title),
      if (gif.username != null && gif.username!.isNotEmpty)
        _InfoRow(label: 'Username', value: gif.username!),
      if (gif.rating != null && gif.rating!.isNotEmpty)
        _RatingRow(rating: gif.rating!),
    ];

    final gifWidget = ClipRRect( // rounds corners
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          // Prefer original GIF, fallback to preview if original is missing.
          gif.originalUrl.isNotEmpty ? gif.originalUrl : gif.previewUrl,
          fit: BoxFit.contain, // full image
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            // progress indicator while the image is loading
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) {
            // if image fails to load
            return const Center(
              child: Text('Failed to load GIF'),
            );
          },
        ),
      );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      appBar: AppBar(
        title: Text(gif.title.isNotEmpty ? gif.title : 'GIF'),
      ),
      body: SafeArea(
        child: OrientationBuilder( // rebuilds when orientation changes
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              // Landscape: image on the left and metadata list on the right.
              return Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: gifWidget,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: ListView(
                        children: infoWidgets,
                      ),
                    ),
                  ],
                ),
              );
            }

            // Portrait: stack image first, then metadata below.
            return ListView(
              padding: const EdgeInsets.all(4),
              children: [
                gifWidget,
                const SizedBox(height: 16),
                ...infoWidgets,
              ],
            );
          },
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingRow extends StatelessWidget {
  const _RatingRow({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Rating is shown as a chip to visually separate it as a tag.
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              'Rating',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Chip(
            label: Text(
              rating.toUpperCase(),
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
