// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/large_category_model.dart';

class LargeCategoriesResponse {
  List<LargeCategoryModel> data;
  LargeCategoriesResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'large_categories': data.map((x) => x.toMap()).toList(),
    };
  }

  factory LargeCategoriesResponse.fromMap(Map<String, dynamic> map) {
    return LargeCategoriesResponse(
      data: List<LargeCategoryModel>.from(
        (map['data'] as List<dynamic>).map<LargeCategoryModel>(
          (x) => LargeCategoryModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory LargeCategoriesResponse.fromJson(String source) =>
      LargeCategoriesResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
