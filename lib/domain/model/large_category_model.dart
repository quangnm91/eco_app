// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LargeCategoryModel {
  int id;
  String name;
  String icon;
  LargeCategoryModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'icon': icon,
    };
  }

  factory LargeCategoryModel.fromMap(Map<String, dynamic> map) {
    return LargeCategoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LargeCategoryModel.fromJson(String source) =>
      LargeCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
