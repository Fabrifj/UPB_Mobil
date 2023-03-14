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
    Size size = MediaQuery.of(context).size;

    final laMejorAppPara = Center(
        child: Container(
            margin: EdgeInsets.only(left: 192, right: 192),
            child: Text(
              'La mejor app para contactarnos entre upbinos',
              style:
                  UpbTextStyle.getTextStyle('h2', ColorResourcees.p_Blue, 'n'),
              textAlign: TextAlign.justify,
            )));

    final iniciarSesion = ElevatedButton(
      onPressed: _toggleLoginForm,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorResourcees.s_Yellow),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
        textStyle: MaterialStateProperty.all(
            UpbTextStyle.getTextStyle('h4', ColorResourcees.s_white, 'b')),
        shadowColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Text('Iniciar sesión'),
    );
    final continuarCon =
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          width: size.width * 0.1,
          child: Divider(
            thickness: 1,
            color: ColorResourcees.p_Blue,
          )),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Continuar con',
            style: UpbTextStyle.getTextStyle('', ColorResourcees.p_Blue, 'l'),
          )),
      SizedBox(
          width: size.width * 0.1,
          child: Divider(
            thickness: 1,
            color: ColorResourcees.p_Blue,
          ))
    ]);

    final crearCuenta = GestureDetector(
        onTap: () {
          Application.router.navigateTo(
            context,
            "registration",
            transition: TransitionType.inFromRight,
          );
        },
        child: Text('Crear tu cuenta',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-Bold',
              fontSize: 12,
            )));
    final login1 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        laMejorAppPara,
        const SizedBox(height: 128),
        Text(
          'UPB App',
          style: UpbTextStyle.getTextStyle('b1', ColorResourcees.p_Blue, 'n'),
        ),
        const SizedBox(height: 32),
        iniciarSesion,
        SizedBox(height: 16),
        crearCuenta,
        SizedBox(height: 96),
        continuarCon
      ],
    );

    final usuarioYContrasena = Column(
      children: [
        TextField(
          controller: _userController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(51, 83, 230, 0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: 'Usuario'),
        ),
        SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(51, 83, 230, 0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: 'Contraseña'),
        ),
      ],
    );
    final login2 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 80),
                child: Column(children: <Widget>[
                  Text(
                    '¡Hola',
                    style: UpbTextStyle.getTextStyle(
                        'h2', ColorResourcees.p_Blue, 'n'),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    'de nuevo!',
                    style: UpbTextStyle.getTextStyle(
                        'h2', ColorResourcees.s_Yellow, 'n'),
                    textAlign: TextAlign.justify,
                  ),
                ])),
            Container(
              width: size.width * 0.65,
              child: Column(
                children: [
                  usuarioYContrasena,
                  SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        fillColor:
                            MaterialStateProperty.all(ColorResourcees.s_Yellow),
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Recordar mis datos',
                        style: TextStyle(
                          color: ColorResourcees.p_Blue,
                          fontFamily: 'Montserrat-Black',
                          fontSize: 10,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Olvidé mi contraseña',
                          style: TextStyle(
                            color: ColorResourcees.p_Blue,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat-Bold',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String user = _userController.text;
                String password = _passwordController.text;
                if (user.isNotEmpty && password.isNotEmpty) {
                  Application.router.navigateTo(
                    context,
                    "home",
                    transition: TransitionType.inFromRight,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(ColorResourcees.s_Yellow),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                )),
                textStyle: MaterialStateProperty.all(UpbTextStyle.getTextStyle(
                    'h4', ColorResourcees.s_white, 'b')),
                shadowColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Text('Entrar'),
            ),
          ],
        ),
      ],
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[!_showLoginForm ? login1 : login2],
        ),
      ),
    );
  }
}
