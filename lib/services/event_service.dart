import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_flutter/services/models/event.dart';

class EventService {
  static final EventService _instance = EventService._internal();

  EventService._internal();

  factory EventService() {
    return _instance;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Event>> getEvents() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('events').get();
      List<Event> events = querySnapshot.docs
          .map((doc) => Event.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      return events;
    } catch (e) {
      throw Exception('Error fetching collection: $e');
    }
  }

  // Future<Event> getEvent(String collectionPath, String documentId) async {
  //   try {
  //     DocumentSnapshot documentSnapshot =
  //         await _firestore.collection(collectionPath).doc(documentId).get();
  //     return documentSnapshot.data() as Map<String, dynamic>?;
  //   } catch (e) {
  //     throw Exception('Error fetching document: $e');
  //   }
  // }
}
