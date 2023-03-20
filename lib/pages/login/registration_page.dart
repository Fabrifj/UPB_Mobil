import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:upb_mobil/routes/aplication.dart';
import '../../components/upb_scafold.dart';

class RegistrationPage extends StatelessWidget {
  final String title;
  const RegistrationPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return UpbScaffold(
      title: title,
      body: Container(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Application.router.navigateTo(context, "content-management",
                  //     transition: TransitionType.inFromRight);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
