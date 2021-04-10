import 'package:flutter/material.dart';
import 'package:splitbill_client/src/routes/base_route.dart';
import 'package:splitbill_client/src/screens/bill_details/bill_details.dart';

class BillDetailsRoute extends BaseRoute {
  @override
  Widget handler(BuildContext context, Map<String, List<String>> parameters) {
    final billId = int.tryParse(parameters['bill_id'][0]);

    return BillDetailsScreen(billId);
  }

  @override
  String get templatePath => '/bills/:bill_id';

  static String constructPath({ @required int billId }) => '/bills/$billId';
}
