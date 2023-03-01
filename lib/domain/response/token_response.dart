// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../model/token_model.dart';

class TokenResponse {
  TokenModel data;
  TokenResponse({required this.data});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory TokenResponse.fromMap(Map<String, dynamic> map) {
    return TokenResponse(
      data: TokenModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenResponse.fromJson(String source) =>
      TokenResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
