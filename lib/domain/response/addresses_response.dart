// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eco_app/domain/model/address_model.dart';

class AddressesResponse {
  List<Address> data;
  AddressesResponse({
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory AddressesResponse.fromMap(Map<String, dynamic> map) {
    return AddressesResponse(
      data: List<Address>.from(
        (map['data'] as List<dynamic>).map<Address>(
          (x) => Address.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressesResponse.fromJson(String source) =>
      AddressesResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
