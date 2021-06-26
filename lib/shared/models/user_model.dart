import 'dart:convert';

class UserModel {

  final String name;
  final String email;
  final String? photoUrl;

  UserModel({required this.name, required this.email, this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    name: map['name'],
    email: map['email'],
    photoUrl: map['photoUrl']
  );

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();

      map['name'] = name;
      map['email'] = email;
      map['photoUrl'] = photoUrl;

    return map;
  }

  String toJson() => jsonEncode(toMap());
}