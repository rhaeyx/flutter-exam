import 'package:exam_flutter/pages/components/custom_card.dart';
import 'package:exam_flutter/pages/components/event_details.dart';
import 'package:exam_flutter/services/models/event.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EventCard extends StatefulWidget {
  final Event event;

  const EventCard({
    super.key,
    required this.event,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomCard(
        width: screenWidth > 1520 ? 0.5 * screenWidth : 0.9 * screenWidth,
        title: SizedBox(
          width: 0.3 * screenWidth,
          child: Text(
            widget.event.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        description: SizedBox(
          width: 0.3 * screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShadBadge(child: Text(widget.event.date)),
              const SizedBox(height: 8),
              ShadBadge.destructive(
                child: Text(
                  widget.event.location,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
        photos: Stack(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                widget.event.photoUrls[0],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 2,
              child: ShadBadge(
                child: Text("${widget.event.photoUrls.length - 1} more"),
              ),
            )
          ],
        ),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ShadButton.outline(
              icon: const FaIcon(FontAwesomeIcons.pencil),
              onPressed: () {},
              child: const Text('Edit'),
            ),
            const SizedBox(width: 16),
            ShadButton(
              icon: const FaIcon(FontAwesomeIcons.eye),
              onPressed: () => showShadSheet(
                side: ShadSheetSide.right,
                context: context,
                builder: (context) => EventDetailsSheet(event: widget.event),
              ),
              child: const Text('View'),
            ),
          ],
        ),
        child: SizedBox(
          width: 0.3 * screenWidth,
          child: Text(
            widget.event.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
