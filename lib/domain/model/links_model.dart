import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LinksModel {
  String first;
  String last;
  String? prev;
  String? next;
  LinksModel({
    required this.first,
    required this.last,
    this.prev,
    this.next,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }

  factory LinksModel.fromMap(Map<String, dynamic> map) {
    return LinksModel(
      first: map['first'] as String,
      last: map['last'] as String,
      prev: map['prev'] != null ? map['prev'] as String : null,
      next: map['next'] != null ? map['next'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LinksModel.fromJson(String source) =>
      LinksModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
