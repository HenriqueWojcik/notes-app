import '../entities/request.dart';

abstract class CommunicationInterface {
  Future get(Request? firebaseCommunication);
  Future post();
  Future put();
  Future delete();
}
