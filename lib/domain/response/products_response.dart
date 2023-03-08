// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/meta_model.dart';
import 'package:eco_app/domain/model/product_model.dart';

import '../model/links_model.dart';

class ProductsResponse {
  List<ProductModel> data;
  LinksModel links;
  MetaModel meta;
  ProductsResponse({
    required this.data,
    required this.links,
    required this.meta,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
      'links': links.toMap(),
      'meta': meta.toMap(),
    };
  }

  factory ProductsResponse.fromMap(Map<String, dynamic> map) {
    return ProductsResponse(
      data: List<ProductModel>.from(
        (map['data'] as List<dynamic>).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      links: LinksModel.fromMap(map['links'] as Map<String, dynamic>),
      meta: MetaModel.fromMap(map['meta'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsResponse.fromJson(String source) =>
      ProductsResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ProductsResponse(data: $data, links: $links, meta: $meta)';
}
