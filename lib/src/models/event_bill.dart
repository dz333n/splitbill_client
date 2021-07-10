import 'package:json_annotation/json_annotation.dart';
import 'package:splitbill_client/src/models/bill.dart';

part 'event_bill.g.dart';

@JsonSerializable()
class EventBill {
  Bill bill;
  double totalCost;

  EventBill({
    required this.bill,
    required this.totalCost,
  });

  factory EventBill.fromJson(Map<String, dynamic> json) =>
      _$EventBillFromJson(json);

  Map<String, dynamic> toJson() => _$EventBillToJson(this);
}
