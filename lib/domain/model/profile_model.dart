// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/image_model.dart';

class Profile {
  String id;
  String userId;
  String? fullName;
  String? description;
  ImageModel? image;
  Profile({
    required this.id,
    required this.userId,
    this.fullName,
    this.description,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'fullName': fullName,
      'description': description,
      'image': image?.toMap(),
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      userId: map['userId'] as String,
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null
          ? ImageModel.fromMap(map['image'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
