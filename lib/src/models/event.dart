import 'package:json_annotation/json_annotation.dart';
import 'package:splitbill_client/src/models/user.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final int id;
  final String title;
  final DateTime date;
  final User creator;

  Event({this.id, this.title, this.date, this.creator});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
