// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Address {
  String id;
  String userId;
  String name;
  String address;
  String phoneNumber;
  String provinceId;

  Address(
      {required this.id,
      required this.userId,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.provinceId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'name': name,
      'address': address,
      'phone_number': phoneNumber,
      'province_id': provinceId,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      phoneNumber: map['phoneNumber'] as String,
      provinceId: map['provinceId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);
}
