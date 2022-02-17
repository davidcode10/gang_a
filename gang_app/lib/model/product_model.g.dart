// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map json) => ProductModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      originalPrice: json['originalPrice'] as String?,
      realPrice: json['realPrice'] as String?,
      photoUrl: json['photoUrl'] as String?,
      productCategory: json['productCategory'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'description': instance.description,
      'originalPrice': instance.originalPrice,
      'realPrice': instance.realPrice,
      'photoUrl': instance.photoUrl,
      'productCategory': instance.productCategory,
    };
