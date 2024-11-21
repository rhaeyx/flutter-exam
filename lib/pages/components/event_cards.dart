import 'package:exam_flutter/pages/components/event_card.dart';
import 'package:exam_flutter/services/models/event.dart';
import 'package:flutter/material.dart';
import 'package:exam_flutter/services/event_service.dart';

class EventCards extends StatefulWidget {
  const EventCards({super.key});

  @override
  State<EventCards> createState() => _EventCardsState();
}

class _EventCardsState extends State<EventCards> {
  @override
  Widget build(BuildContext context) {
    EventService eventService = EventService();

    return FutureBuilder<List<Event>>(
      future: eventService.getEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final Event event = snapshot.data![index];
                return EventCard(event: event);
              },
            ),
          );
        }
      },
    );
  }
}
