import 'package:gang_app/model/boil_volume.dart';
import "package:json_annotation/json_annotation.dart";
part "beer_model.g.dart";

@JsonSerializable(anyMap: true, explicitToJson: true)
class Beer {
  BoilVolume? boil_volume;
  String? name;
  String? image_url;
  String? description;
  String? tagline;
  int? id;
  bool? isFavorite;

  Beer(this.name, this.image_url, this.description, this.boil_volume,
      this.tagline, this.id, this.isFavorite);

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  Map<String, dynamic> toJson() => _$BeerToJson(this);
}
