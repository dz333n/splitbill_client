import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/product_description.dart';
import 'package:splitbill_client/src/screens/bill_details/components/take_part_button.dart';

class ChosenProductCard extends StatelessWidget {
  final ChosenProduct chosenProduct;

  ChosenProductCard(this.chosenProduct);

  static final _padding = const EdgeInsets.only(
    top: 16.0,
    left: 16.0,
    right: 16.0,
    bottom: 0.0,
  );

  @override
  Widget build(BuildContext context) {
    final product = chosenProduct.product;

    return Card(
      child: Padding(
        padding: _padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductDescription(product),
            Center(
              child: TakePartButton(
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
