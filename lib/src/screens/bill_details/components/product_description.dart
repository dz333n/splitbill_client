import 'package:flutter/material.dart';
import 'package:splitbill_client/src/models/product.dart';

class ProductDescription extends StatelessWidget {
  final Product product;

  ProductDescription(this.product);

  @override
  Widget build(BuildContext context) {
    final price = product.price.ceil().toString();
    final amount = product.amount.ceil().toString();
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: textTheme.bodyText2!.copyWith(fontSize: 16.0),
            ),
            Text(
              "Quantity: $amount",
              style: textTheme.bodyText2!.copyWith(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
              ),
            ),
          ],
        ),
        Text("$price 💰"),
      ],
    );
  }
}
