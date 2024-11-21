import 'package:exam_flutter/pages/components/image_carousel.dart';
import 'package:exam_flutter/services/models/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EventDetailsSheet extends StatelessWidget {
  final ShadSheetSide side = ShadSheetSide.right;
  final Event event;

  const EventDetailsSheet({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    double screenWidth = MediaQuery.sizeOf(context).width;

    List<Widget> content = [
      Text(event.name, style: theme.textTheme.large),
      const SizedBox(height: 16),
      ShadBadge(
        child: Text(event.date),
      ),
      const SizedBox(height: 16),
      ShadBadge.destructive(
        child: Text(event.location, style: theme.textTheme.small),
      ),
      const SizedBox(height: 16),
      Text(event.description, style: theme.textTheme.small),
      const SizedBox(height: 16),
      ImageCarousel(photoUrls: event.photoUrls),
    ];

    return ShadSheet(
      constraints: BoxConstraints(
          maxWidth: screenWidth > 1520 ? 0.5 * screenWidth : 0.9 * screenWidth),
      title: Text('Event Details', style: theme.textTheme.h1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: content,
        ),
      ),
    );
  }
}
