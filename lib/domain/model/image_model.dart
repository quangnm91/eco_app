import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageModel {
  int id;
  String url;
  ImageModel({
    required this.id,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] as int,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
