import 'package:flutter_notes_app/core/entities/request.dart';

extension RequestSample on Request {
  static Request get sample => const Request(
        collection: 'collection',
        parameters: {'key': 'value'},
      );
}
