// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/province_model.dart';

class Address {
  int id;
  int userId;
  String name;
  String address;
  String phoneNumber;
  int provinceId;
  ProvinceModel? province;

  Address({
    required this.id,
    required this.userId,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.provinceId,
    this.province,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'name': name,
      'address': address,
      'phone_number': phoneNumber,
      'province_id': provinceId,
      'province': province?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as int,
      userId: map['user_id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      phoneNumber: map['phone_number'] as String,
      provinceId: map['province_id'] as int,
      province: map['province'] != null
          ? ProvinceModel.fromMap(map['province'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
