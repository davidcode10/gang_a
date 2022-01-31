// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Beer _$BeerFromJson(Map json) => Beer(
      json['name'] as String?,
      json['image_url'] as String?,
      json['description'] as String?,
      json['boil_volume'] == null
          ? null
          : BoilVolume.fromJson(
              Map<String, dynamic>.from(json['boil_volume'] as Map)),
      json['tagline'] as String?,
      json['id'] as int?,
      json['isFavorite'] as bool?,
    );

Map<String, dynamic> _$BeerToJson(Beer instance) => <String, dynamic>{
      'boil_volume': instance.boil_volume?.toJson(),
      'name': instance.name,
      'image_url': instance.image_url,
      'description': instance.description,
      'tagline': instance.tagline,
      'id': instance.id,
      'isFavorite': instance.isFavorite,
    };
