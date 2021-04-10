import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';

class ChosenProductsList extends StatelessWidget {
  final List<ChosenProduct> chosenProducts;

  ChosenProductsList(this.chosenProducts);

  @override
  Widget build(BuildContext context) {
    return Text("bills");
  }
}
