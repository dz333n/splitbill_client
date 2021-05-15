import 'package:json_annotation/json_annotation.dart';
import 'package:splitbill_client/src/models/user.dart';

part 'debt.g.dart';

@JsonSerializable()
class Debt {
  final double money;
  final User recipient;
  final User sender;

  Debt({this.money, this.recipient, this.sender});

  factory Debt.fromJson(Map<String, dynamic> json) => _$DebtFromJson(json);
  Map<String, dynamic> toJson() => _$DebtToJson(this);
}
