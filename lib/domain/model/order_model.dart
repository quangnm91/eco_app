// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/address_model.dart';
import 'package:eco_app/domain/model/shopping_session_model.dart';

class OrderModel {
  int id;
  int status;
  int userId;
  ShoppingSessionModel shoppingSession;
  Address userAddress;
  OrderModel({
    required this.id,
    required this.status,
    required this.userId,
    required this.shoppingSession,
    required this.userAddress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'status': status,
      'user_id': userId,
      'shopping_session': shoppingSession.toMap(),
      'user_address': userAddress.toMap(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as int,
      status: map['status'] as int,
      userId: map['user_id'] as int,
      shoppingSession: ShoppingSessionModel.fromMap(
          map['shopping_session'] as Map<String, dynamic>),
      userAddress: Address.fromMap(map['user_address'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
