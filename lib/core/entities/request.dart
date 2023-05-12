import 'package:equatable/equatable.dart';

class Request extends Equatable {
  final String collection;
  final Map<String, dynamic>? data;

  const Request({
    required this.collection,
    this.data,
  });

  @override
  List<Object?> get props => [collection, data];
}
