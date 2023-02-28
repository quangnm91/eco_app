// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'address_model.dart';
import 'profile_model.dart';

class User {
  String id;
  String email;
  int role;
  List<Address> addresses;
  Profile profile;
  User({
    required this.id,
    required this.email,
    required this.role,
    required this.addresses,
    required this.profile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'role': role,
      'addresses': addresses.map((x) => x.toMap()).toList(),
      'profile': profile.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      role: map['role'] as int,
      addresses: List<Address>.from(
        (map['addresses'] as List<int>).map<Address>(
          (x) => Address.fromMap(x as Map<String, dynamic>),
        ),
      ),
      profile: Profile.fromMap(map['profile'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
