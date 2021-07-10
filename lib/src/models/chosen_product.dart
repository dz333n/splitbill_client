import 'package:json_annotation/json_annotation.dart';
import 'package:splitbill_client/src/models/product.dart';

part 'chosen_product.g.dart';

@JsonSerializable()
class ChosenProduct {
  final Product product;
  final double? coefficient;

  ChosenProduct({required this.product, this.coefficient});

  factory ChosenProduct.fromJson(Map<String, dynamic> json) =>
      _$ChosenProductFromJson(json);
  Map<String, dynamic> toJson() => _$ChosenProductToJson(this);
}
