import 'package:flutter/material.dart';

import '../../components/upb_scafold.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Login"),
        ),
      ),);
  }
}
