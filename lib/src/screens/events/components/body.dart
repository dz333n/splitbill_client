import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/components/users/user_avatar.dart';
import 'package:splitbill_client/src/components/utils/loading_states/error_state.dart';
import 'package:splitbill_client/src/components/utils/loading_states/loading_data_state.dart';
import 'package:splitbill_client/src/models/event.dart';
import 'package:splitbill_client/src/routes/event_details_route.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

final _eventsList = FutureProvider.autoDispose<List<Event>>((ref) {
  return client.getEvents();
});

class EventsScreenBody extends HookWidget {
  final _dateFormatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    final eventsListState = useProvider(_eventsList);

    return eventsListState.when(
      loading: LoadingDataState.forAsyncValue,
      error: ErrorState.forAsyncValue,
      data: (eventsList) => ListView.builder(
        itemCount: eventsList.length,
        itemBuilder: (BuildContext context, int index) {
          final event = eventsList[index];
          final String formattedDate = _dateFormatter.format(event.date);

          final goToEvent = () {
            final path = EventDetailsRoute.constructPath(eventId: event.id);
            print(path);
            Application.router.navigateTo(context, path);
          };

          return ListTile(
            onTap: goToEvent,
            leading: AspectRatio(
              aspectRatio: 1,
              child: UserAvatar(user: event.creator, size: 45),
            ),
            title: Text(event.title),
            subtitle: Text(formattedDate),
          );
        },
      ),
    );
  }
}
