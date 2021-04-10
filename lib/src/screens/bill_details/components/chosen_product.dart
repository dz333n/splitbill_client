import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/product_description.dart';

class ChosenProductCard extends StatelessWidget {
  final ChosenProduct chosenProduct;

  ChosenProductCard(this.chosenProduct);

  @override
  Widget build(BuildContext context) {
    final product = chosenProduct.product;

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: ProductDescription(product),
          ),
        ],
      ),
    );
  }
}
