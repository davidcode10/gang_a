import 'package:json_annotation/json_annotation.dart';
part 'video_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class VideoModel {
  String? uid;
  String? title;
  String? subtitle;
  String? urlImage;
  String? urlVideo;

  VideoModel({
    this.uid,
    this.title,
    this.subtitle,
    this.urlImage,
    this.urlVideo,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
