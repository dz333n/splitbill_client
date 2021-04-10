import 'package:flutter/material.dart';
import 'package:splitbill_client/src/screens/events/components/body.dart';
import 'package:splitbill_client/src/services/split_bill_api/token_manager.dart';

class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: EventsScreenBody(),
    );
  }
}
