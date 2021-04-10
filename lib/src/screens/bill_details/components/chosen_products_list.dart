import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/no_chosen_products.dart';

class ChosenProductsList extends StatelessWidget {
  final List<ChosenProduct> chosenProducts;

  ChosenProductsList(this.chosenProducts);

  @override
  Widget build(BuildContext context) {
    if (chosenProducts.isEmpty) {
      return NoChosenProducts();
    }

    return ListView.builder(
      itemCount: chosenProducts.length,
      itemBuilder: (BuildContext context, int index) {
        return ChosenProductCard(chosenProducts[index]);
      },
    );
  }
}
