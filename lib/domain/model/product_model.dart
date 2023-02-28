// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/image_model.dart';

class ProductModel {
  int id;
  String name;
  int merchantId;
  String? description;
  List<ImageModel>? images;
  int price;
  String unitType;
  int quantity;
  int? discountId;
  int? largeCategoryId;
  int? smallCategoryId;
  int? provinceId;
  ProductModel({
    required this.id,
    required this.name,
    required this.merchantId,
    this.description,
    this.images,
    required this.price,
    required this.unitType,
    required this.quantity,
    this.discountId,
    this.largeCategoryId,
    this.smallCategoryId,
    this.provinceId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'merchant_id': merchantId,
      'description': description,
      'images': images?.map((x) => x.toMap()).toList(),
      'price': price,
      'unit_type': unitType,
      'quantity': quantity,
      'discountId': discountId,
      'large_category_id': largeCategoryId,
      'small_category_id': smallCategoryId,
      'province_id': provinceId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      merchantId: map['merchant_id'] as int,
      description:
          map['description'] != null ? map['description'] as String : null,
      images: map['images'] != null
          ? List<ImageModel>.from(
              (map['images'] as List<dynamic>).map<ImageModel?>(
                (x) => ImageModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      price: map['price'] as int,
      unitType: map['unit_type'] as String,
      quantity: map['quantity'] as int,
      discountId: map['discount_id'] != null ? map['discount_id'] as int : null,
      largeCategoryId: map['large_category_id'] != null
          ? map['large_category_id'] as int
          : null,
      smallCategoryId: map['small_category_id'] != null
          ? map['small_category_id'] as int
          : null,
      provinceId: map['province_id'] != null ? map['province_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
