// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map json) => VideoModel(
      uid: json['uid'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      urlImage: json['urlImage'] as String?,
      urlVideo: json['urlVideo'] as String?,
    );

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'urlImage': instance.urlImage,
      'urlVideo': instance.urlVideo,
    };
