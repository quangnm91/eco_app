import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProvinceModel {
  int id;
  String name;
  String postalCode;
  ProvinceModel({
    required this.id,
    required this.name,
    required this.postalCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'postal_code': postalCode,
    };
  }

  factory ProvinceModel.fromMap(Map<String, dynamic> map) {
    return ProvinceModel(
      id: map['id'] as int,
      name: map['name'] as String,
      postalCode: map['postal_code'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProvinceModel.fromJson(String source) =>
      ProvinceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
