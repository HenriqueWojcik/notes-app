import '../entities/request.dart';

abstract class CommunicationInterface {
  Future<List<Map<String, dynamic>>> get(AppRequest request);
  Future<Map<String, dynamic>> post(AppRequest request);
  Future<Map<String, dynamic>> put(AppRequest request);
  Future<bool> delete(AppRequest request);
}
