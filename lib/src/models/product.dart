import 'package:json_annotation/json_annotation.dart';
import 'package:splitbill_client/src/models/bill.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final double amount;
  final double price;
  final String title;
  final Bill bill;

  Product({
    required this.amount,
    required this.price,
    required this.title,
    required this.id,
    required this.bill,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
