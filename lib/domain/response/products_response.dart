// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/product_model.dart';

class ProductsResponse {
  List<ProductModel> data;
  ProductsResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductsResponse.fromMap(Map<String, dynamic> map) {
    return ProductsResponse(
      data: List<ProductModel>.from(
        (map['data'] as List<dynamic>).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsResponse.fromJson(String source) {
    return ProductsResponse.fromMap(
        json.decode(source) as Map<String, dynamic>);
    ;
  }
}
