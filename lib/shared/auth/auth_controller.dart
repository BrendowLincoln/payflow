import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME, arguments: user);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
    }
  }


  Future<void> saveUser(UserModel user) async {

    final instance = await SharedPreferences.getInstance();
    instance.setString("user", user.toJson());
    return Future.value();
  }

  Future<void> currentUser(BuildContext context) async {

    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 2));

    if(instance.containsKey('user')) {
      final json = instance.get("user") as String;
      setUser(context, UserModel.fromJson(json));
      return Future.value();
    } else {

      setUser(context, null);
    }
  }
}