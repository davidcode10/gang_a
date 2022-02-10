import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProductModel {
  String? uid;
  final String? name;
  final String? description;
  final String? originalPrice;
  final String? realPrice;
  final String? photoUrl;

  ProductModel(
      {this.uid,
      this.name,
      this.description,
      this.originalPrice,
      this.realPrice,
      this.photoUrl});

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
