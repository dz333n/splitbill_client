import 'package:json_annotation/json_annotation.dart';
import 'package:splitbill_client/src/models/user.dart';

part 'bill.g.dart';

@JsonSerializable()
class Bill {
  int id;
  String name;
  @JsonKey(name: 'user')
  User creator;

  Bill({ this.id, this.name, this.creator });
  
  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}