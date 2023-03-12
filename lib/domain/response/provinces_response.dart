// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../model/province_model.dart';

class ProvincesResponse {
  List<ProvinceModel> data;
  ProvincesResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory ProvincesResponse.fromMap(Map<String, dynamic> map) {
    return ProvincesResponse(
      data: List<ProvinceModel>.from(
        (map['data'] as List<dynamic>).map<ProvinceModel>(
          (x) => ProvinceModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProvincesResponse.fromJson(String source) =>
      ProvincesResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
