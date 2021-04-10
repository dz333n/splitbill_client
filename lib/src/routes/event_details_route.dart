import 'package:flutter/material.dart';
import 'package:splitbill_client/src/routes/base_route.dart';
import 'package:splitbill_client/src/screens/event_details/event_details.dart';

class EventDetailsRoute extends BaseRoute {
  @override
  Widget handler(BuildContext context, Map<String, List<String>> parameters) {
    final eventId = int.tryParse(parameters['event_id'][0]);

    return EventDetailsScreen(eventId);
  }

  @override
  String get templatePath => '/events/:event_id';

  static String constructPath({ @required int eventId }) => '/events/$eventId';
}
