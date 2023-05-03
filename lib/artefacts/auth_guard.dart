import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upb_mobil/pages/login/login_page.dart';

class AuthGuardWidget extends StatelessWidget {
  final Widget child;

  AuthGuardWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isAuthenticated(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.data == true) {
            return child;
          } else {
            return LoginPage();
          }
        }
      },
    );
  }

  static Future<bool> isAuthenticated() async {
    final user = await FirebaseAuth.instance.authStateChanges().first;
    return user != null;
  }
}
