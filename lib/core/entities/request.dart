class Request {
  final String collection;
  final Map<String, dynamic>? data;

  Request({
    required this.collection,
    this.data,
  });
}
