import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upb_mobil/routes/aplication.dart';
import '../static_resources/user_provider.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  AuthGuard({required this.child});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    if (userProvider.user == null) {
      Application.router.navigateTo(context, "login");
    }

    return child;
  }
}
