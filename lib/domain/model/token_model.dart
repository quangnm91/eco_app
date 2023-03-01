// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user_model.dart';

class TokenModel {
  String tokenType;
  String accessToken;
  UserModel user;
  TokenModel({
    required this.tokenType,
    required this.accessToken,
    required this.user,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tokenType': tokenType,
      'accessToken': accessToken,
      'user': user.toMap(),
    };
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      tokenType: map['token_type'] as String,
      accessToken: map['access_token'] as String,
      user: UserModel.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) =>
      TokenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
