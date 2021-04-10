import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';

class ChosenProductCard extends StatelessWidget {
  final ChosenProduct chosenProduct;

  ChosenProductCard(this.chosenProduct);

  @override
  Widget build(BuildContext context) {
    final product = chosenProduct.product;
    final price = product.price.ceil().toString();
    final amount = product.amount.ceil().toString();

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(product.title),
            subtitle: Text("Amount: $amount"),
            trailing: Text("$price G"),
          ),
        ],
      ),
    );
  }
}
