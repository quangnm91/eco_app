// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/product_model.dart';

class ProductResponse {
  ProductModel data;
  ProductResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory ProductResponse.fromMap(Map<String, dynamic> map) {
    return ProductResponse(
      data: ProductModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromJson(String source) =>
      ProductResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
