// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'address_model.dart';
import 'profile_model.dart';

class UserModel {
  int id;
  String email;
  int role;
  List<Address>? addresses;
  Profile profile;
  UserModel({
    required this.id,
    required this.email,
    required this.role,
    this.addresses,
    required this.profile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'role': role,
      'addresses': addresses?.map((x) => x.toMap()).toList(),
      'profile': profile.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      role: map['role'] as int,
      addresses: map['addresses'] != null
          ? List<Address>.from(
              (map['addresses'] as List<dynamic>).map<Address?>(
                (x) => Address.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      profile: Profile.fromMap(map['profile'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
