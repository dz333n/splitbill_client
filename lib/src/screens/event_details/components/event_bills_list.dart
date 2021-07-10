import 'package:flutter/material.dart';
import 'package:splitbill_client/src/application.dart';
import 'package:splitbill_client/src/components/users/user_avatar.dart';
import 'package:splitbill_client/src/models/event_bill.dart';
import 'package:splitbill_client/src/routes/bill_details_route.dart';
import 'package:splitbill_client/src/screens/event_details/components/no_event_bills.dart';

class EventBillsList extends StatelessWidget {
  final List<EventBill> eventBills;

  EventBillsList({required this.eventBills});

  @override
  Widget build(BuildContext context) {
    if (eventBills.isEmpty) {
      return NoEventBills();
    }

    return ListView(
      children: eventBills.map((eventBill) {
        final bill = eventBill.bill;

        final goToBill = () {
          final path = BillDetailsRoute.constructPath(billId: bill.id);
          Application.router.navigateTo(context, path);
        };

        return ListTile(
          onTap: goToBill,
          title: Text(bill.name),
          leading: AspectRatio(
            aspectRatio: 1,
            child: UserAvatar(user: eventBill.bill.creator, size: 45),
          ),
          subtitle: Text("Total cost: ${eventBill.totalCost.floor()}"),
        );
      }).toList(),
    );
  }
}
