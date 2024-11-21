import 'package:shadcn_ui/shadcn_ui.dart';

class Event {
  final String name;
  final String location;
  final String description;
  final String date;
  final List<String> photoUrls;

  Event({
    required this.name,
    required this.location,
    required this.description,
    required this.date,
    required this.photoUrls,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'],
      location: map['location'],
      description: map['description'],
      date: DateFormat('MM/dd/yyyy, hh:mm a').format(map['date'].toDate()),
      photoUrls: map['photoUrls'].cast<String>(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'description': description,
      'date': date,
      'photoUrls': photoUrls,
    };
  }
}
