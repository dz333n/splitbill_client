import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/chosen_product.dart';
import 'package:splitbill_client/src/screens/bill_details/components/product_description.dart';
import 'package:splitbill_client/src/screens/bill_details/components/take_part_button.dart';
import 'package:splitbill_client/src/services/split_bill_api/split_bill_api.dart';

class ChosenProductCard extends StatelessWidget {
  final int billId;
  final ChosenProduct chosenProduct;

  ChosenProductCard(this.billId, this.chosenProduct);

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
                onTap: () => _takePart(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _takePart() {
    client.putChosenProduct(
      billId,
      ChosenProduct(
        coefficient: 1,
        product: chosenProduct.product,
      ),
    );
  }
}
