import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductModel {
  String? uid;
  final String? name;
  final String? description;
  final String? originalPrice;
  final String? realPrice;

  ProductModel({
    required this.uid,
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.realPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}