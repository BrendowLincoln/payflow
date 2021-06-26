import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {

  Future<void> googleSignIn(BuildContext context) async {
    final authController = AuthController();

    GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email'
        ]
    );
    try {
      final response = await _googleSignIn.signIn();
      final UserModel user = UserModel(name: response!.displayName!, email: response.email, photoUrl: response.photoUrl!);
      authController.setUser(context, user);
      print(response);
    } catch (error) {
      print(error);
    }
  }
}