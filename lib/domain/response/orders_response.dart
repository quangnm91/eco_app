// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../model/order_model.dart';

class OrdersResponse {
  List<OrderModel> data;
  OrdersResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory OrdersResponse.fromMap(Map<String, dynamic> map) {
    return OrdersResponse(
      data: List<OrderModel>.from(
        (map['data'] as List<dynamic>).map<OrderModel>(
          (x) => OrderModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersResponse.fromJson(String source) =>
      OrdersResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
