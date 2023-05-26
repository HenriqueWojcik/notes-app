import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/request.dart';
import '../print/print.dart';
import 'communication_inferface.dart';

class CommunicationImpl implements CommunicationInterface {
  final FirebaseFirestore firebase;

  CommunicationImpl({required this.firebase});

  @override
  Future<List<Map<String, dynamic>>> get(
    Request request,
  ) async {
    final value = await firebase.collection(request.collection).get();

    return value.docs.map((e) {
      final data = e.data();

      data['id'] = e.id;

      return data;
    }).toList();
  }

  @override
  Future<Map<String, dynamic>> post(Request request) async {
    Map<String, dynamic>? data = request.data;

    if (data == null) {
      throw Exception();
    }

    final value = await firebase.collection(request.collection).add(data);

    debugPrint(value);

    return {'id': value.id};
  }

  @override
  Future<Map<String, dynamic>> put(Request request) async {
    Map<String, dynamic>? data = request.data;

    if (data == null) {
      throw Exception();
    }

    if (!data.containsKey('id')) {
      throw Exception();
    }

    final String id = data['id'];

    final result = await firebase
        .collection(request.collection)
        .doc(id)
        .update(data)
        .then((value) => {'id': id});

    return result;
  }

  @override
  Future<bool> delete(Request request) {
    Map<String, dynamic>? data = request.data;

    if (data == null) {
      throw Exception();
    }

    if (!data.containsKey('id')) {
      throw Exception();
    }

    final String id = data['id'];

    return firebase
        .collection(request.collection)
        .doc(id)
        .delete()
        .then((_) => true)
        .catchError((_) => false);
  }
}
