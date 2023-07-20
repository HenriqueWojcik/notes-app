import 'package:equatable/equatable.dart';

class AppRequest extends Equatable {
  final String collection;
  final Map<String, dynamic>? parameters;

  const AppRequest({
    required this.collection,
    this.parameters,
  });

  @override
  List<Object?> get props => [collection, parameters];
}
