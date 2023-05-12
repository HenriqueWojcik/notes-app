import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_notes_app/core/data/communication_inferface.dart';
import 'package:flutter_notes_app/core/entities/request.dart';
import 'package:mockito/annotations.dart';

// Firebase
@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  DocumentSnapshot,
  QuerySnapshot,
])

// Datasources
@GenerateMocks([
  CommunicationInterface,
])

// Entities
@GenerateMocks([
  Request,
])
void main() {}
