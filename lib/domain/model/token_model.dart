// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'user_model.dart';

class Token {
  String tokenType;
  String accessToken;
  User user;
  Token({
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

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      tokenType: map['token_type'] as String,
      accessToken: map['access_token'] as String,
      user: User.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);
}
