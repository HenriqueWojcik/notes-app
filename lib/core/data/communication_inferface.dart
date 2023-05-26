import '../entities/request.dart';

abstract class CommunicationInterface {
  Future<List<Map<String, dynamic>>> get(Request request);
  Future<Map<String, dynamic>> post(Request request);
  Future<Map<String, dynamic>> put(Request request);
  Future<bool> delete(Request request);
}
