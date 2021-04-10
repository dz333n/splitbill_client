import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:splitbill_client/src/components/utils/loading_states/error_state.dart';
import 'package:splitbill_client/src/components/utils/loading_states/loading_data_state.dart';
import 'package:splitbill_client/src/models/event_bill.dart';
import 'package:splitbill_client/src/screens/event_details/components/event_bills_list.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

final _eventBills =
    FutureProvider.autoDispose.family<List<EventBill>, int>((ref, id) {
  ref.maintainState = true;

  return client.getEventBills(id);
});

class EventDetailsScreenBody extends HookWidget {
  final int eventId;

  EventDetailsScreenBody(this.eventId);

  @override
  Widget build(BuildContext context) {
    final eventBills = useProvider(_eventBills(eventId));

    return eventBills.when(
      loading: LoadingDataState.forAsyncValue,
      error: ErrorState.forAsyncValue,
      data: (data) {
        return EventBillsList(eventBills: data);
      },
    );
  }
}
