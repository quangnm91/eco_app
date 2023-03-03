// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'cart_item_model.dart';

class CartModel {
  int id;
  int userId;
  int total;
  List<CartItemModel> cartItems;
  CartModel({
    required this.id,
    required this.userId,
    required this.total,
    required this.cartItems,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'total': total,
      'cart_items': cartItems.map((x) => x.toMap()).toList(),
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      total: map['total'] as int,
      cartItems: List<CartItemModel>.from(
        (map['cart_items'] as List<dynamic>).map<CartItemModel>(
          (x) => CartItemModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
