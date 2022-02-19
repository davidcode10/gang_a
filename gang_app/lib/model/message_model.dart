import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class MessageModel {
  String? id;
  String? from;
  String? roomId;
  String? text;
  int? sentAt;
  // int? sendAt;
  dynamic timestamp;
  dynamic content;

  MessageModel({
    this.id,
    this.from,
    this.roomId,
    this.text,
    // this.sendAt,
    required this.sentAt,
    this.timestamp,
    this.content,
  });

  int getTimesTampMillis() {
    return (timestamp as Timestamp).microsecondsSinceEpoch;
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}