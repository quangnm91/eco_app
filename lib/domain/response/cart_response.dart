// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../model/cart_model.dart';

class CartResponse {
  CartModel data;
  CartResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.toMap(),
    };
  }

  factory CartResponse.fromMap(Map<String, dynamic> map) {
    return CartResponse(
      data: CartModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartResponse.fromJson(String source) =>
      CartResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
