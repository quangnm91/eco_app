// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/large_category_model.dart';

class LargeCategoryResponse {
  LargeCategoryModel data;
  LargeCategoryResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory LargeCategoryResponse.fromMap(Map<String, dynamic> map) {
    return LargeCategoryResponse(
      data: LargeCategoryModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LargeCategoryResponse.fromJson(String source) =>
      LargeCategoryResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
