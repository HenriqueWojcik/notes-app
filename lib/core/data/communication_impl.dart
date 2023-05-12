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

    return value.docs.map((e) => e.data()).toList();
  }

  @override
  Future<Map<String, dynamic>> post(Request request) async {
    Map<String, dynamic>? data = request.data;

    if (data == null) {
      throw Exception();
    }

    final value = await firebase.collection(request.collection).add(data);

    debugPrint(value);

    return {};
  }

  @override
  Future put() {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
