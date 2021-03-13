import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/models/event.dart';
import 'package:splitbill_client/src/screens/event_details/components/body.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

final _eventDetails = FutureProvider.autoDispose.family<Event, int>((ref, id) {
  ref.maintainState = true;

  return client.getEvent(id);
});

class EventDetailsScreen extends HookWidget {
  final int eventId;

  EventDetailsScreen(this.eventId);

  @override
  Widget build(BuildContext context) {
    final eventState = useProvider(_eventDetails(this.eventId));

    return Scaffold(
      appBar: AppBar(title: Text(eventState.when(
        data: (event) => event.title,
        loading: () => '...',
        error: (_, __) => '...',
      ))),
      body: EventDetailsScreenBody(eventId),
    );
  }
}
