import 'package:equatable/equatable.dart';

class Request extends Equatable {
  final String collection;
  final Map<String, dynamic>? parameters;

  const Request({
    required this.collection,
    this.parameters,
  });

  @override
  List<Object?> get props => [collection, parameters];
}
