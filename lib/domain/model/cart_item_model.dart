// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'product_model.dart';

class CartItemModel {
  int id;
  int shoppingSessionId;
  ProductModel product;
  int quantity;

  CartItemModel({
    required this.id,
    required this.shoppingSessionId,
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shopping_session_id': shoppingSessionId,
      'product': product.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItemModel.fromMap(Map<String, dynamic> map) {
    return CartItemModel(
      id: map['id'] as int,
      shoppingSessionId: map['shopping_session_id'] as int,
      product: ProductModel.fromMap(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItemModel.fromJson(String source) =>
      CartItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
