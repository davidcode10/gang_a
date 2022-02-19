// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map json) => MessageModel(
      id: json['id'] as String?,
      from: json['from'] as String?,
      roomId: json['roomId'] as String?,
      text: json['text'] as String?,
      sentAt: json['sentAt'] as int?,
      timestamp: json['timestamp'],
      content: json['content'],
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from,
      'roomId': instance.roomId,
      'text': instance.text,
      'sentAt': instance.sentAt,
      'timestamp': instance.timestamp,
      'content': instance.content,
    };
