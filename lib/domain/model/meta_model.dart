import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MetaModel {
  int currentPage;
  int from;
  int lastPage;
  MetaModel({
    required this.currentPage,
    required this.from,
    required this.lastPage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'current_page': currentPage,
      'from': from,
      'last_page': lastPage,
    };
  }

  factory MetaModel.fromMap(Map<String, dynamic> map) {
    return MetaModel(
      currentPage: map['current_page'] as int,
      from: map['from'] as int,
      lastPage: map['last_page'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaModel.fromJson(String source) =>
      MetaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
