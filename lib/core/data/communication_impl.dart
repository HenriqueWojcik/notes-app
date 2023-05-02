import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/request.dart';
import 'communication_inferface.dart';

class CommunicationImpl implements CommunicationInterface {
  final firebase = FirebaseFirestore.instance;

  @override
  Future get(
    Request? request,
  ) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post() {
    // TODO: implement post
    throw UnimplementedError();
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
