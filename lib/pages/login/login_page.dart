import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:upb_mobil/routes/aplication.dart';
import '../../components/upb_scafold.dart';
import 'package:upb_mobil/static_resources/color_resources.dart';
import 'package:upb_mobil/static_resources/theme_data.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showLoginForm = false;

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  void _toggleLoginForm() {
    setState(() {
      _showLoginForm = !_showLoginForm;
    });
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 192, right: 192),
                child: Text(
                  'La mejor app para contactarnos entre upbinos',
                  style: UpbTextStyle.getTextStyle(
                      'h2', ColorResourcees.p_Blue, 'n'),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 128),
            Text(
              'UPB App',
              style:
                  UpbTextStyle.getTextStyle('b1', ColorResourcees.p_Blue, 'n'),
            ),
            const SizedBox(height: 32),
            !_showLoginForm
                ? ElevatedButton(
                    onPressed: _toggleLoginForm,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorResourcees.s_Yellow),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                          UpbTextStyle.getTextStyle(
                              'h4', ColorResourcees.s_white, 'b')),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: Text('Iniciar sesión'),
                  )
                : Column(
                    children: <Widget>[
                      TextField(
                        controller: _userController,
                        decoration: InputDecoration(hintText: 'Usuario'),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Contraseña'),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text('Recordar mi cuenta'),
                          Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Olvidé mi contraseña',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat-Bold',
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // process the data from the text fields
                          String user = _userController.text;
                          String password = _passwordController.text;
                          // validate the data and navigate to the next screen
                          if (user.isNotEmpty && password.isNotEmpty) {
                            Application.router.navigateTo(
                              context,
                              "next",
                              transition: TransitionType.inFromRight,
                            );
                          }
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                        ),
                        child: Text('Siguiente'),
                      ),
                    ],
                  ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Application.router.navigateTo(
                  context,
                  "registration",
                  transition: TransitionType.inFromRight,
                );
              },
              child: Text(
                'Crear tu cuenta',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat-Bold',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
