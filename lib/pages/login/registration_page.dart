import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:upb_mobil/routes/aplication.dart';
import 'package:upb_mobil/pages/login/login_page.dart';
import 'package:upb_mobil/static_resources/theme_data.dart';
import 'package:upb_mobil/static_resources/color_resources.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPage createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bienvenidoRegistrate = Container(
      margin: const EdgeInsets.only(bottom: 45),
      child: Column(children: <Widget>[
        Text(
          '¡Bienvenido!',
          style: UpbTextStyle.getTextStyle('h2', ColorResourcees.p_Blue, 'n'),
          textAlign: TextAlign.justify,
        ),
        Text(
          'Registrate para continuar',
          style: UpbTextStyle.getTextStyle('h2', ColorResourcees.s_Yellow, 'n'),
          textAlign: TextAlign.justify,
        )
      ]),
    );
    final datos = Column(children: [
      TextField(
        controller: _nameController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(51, 83, 230, 0.1),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Nombre completo'),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(51, 83, 230, 0.1),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'E-mail'),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(51, 83, 230, 0.1),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Contraseña'),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: _phoneController,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(51, 83, 230, 0.1),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Número de celular'),
      ),
    ]);
    final entrarConCuenta = GestureDetector(
        onTap: () {
          Application.router.navigateTo(
            context,
            "/",
            transition: TransitionType.inFromRight,
          );
        },
        child: const Text('Ingresa aquí',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-Bold',
              fontSize: 12,
            )));
    final botonRegistrar = ElevatedButton(
      onPressed: () {
        String email = _emailController.text;
        String password = _passwordController.text;
        String fullName = _nameController.text;
        String phone = _phoneController.text;
        if (email.isNotEmpty &&
            password.isNotEmpty &&
            fullName.isNotEmpty &&
            phone.isNotEmpty) {
          _isLoading ? null : _submit();
        }
      },
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
      child: _isLoading
          ? const CircularProgressIndicator()
          : const Text('Registrar'),
    );
    final continuarCon = Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
            width: size.width * 0.1,
            child: const Divider(
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
            child: const Divider(
              thickness: 1,
              color: ColorResourcees.p_Blue,
            )),
      ]),
      const SizedBox(height: 16),
      const Icon(
        BootstrapIcons.google,
        color: ColorResourcees.p_Blue,
      ),
    ]);
    final registration1 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
                width: size.width * 0.65,
                child: Column(children: [
                  bienvenidoRegistrate,
                  datos,
                  const SizedBox(height: 16),
                  botonRegistrar,
                  const SizedBox(height: 16),
                  const Text('¿Ya tienes una cuenta?',
                      style: TextStyle(
                        color: ColorResourcees.s_Yellow,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat-Bold',
                        fontSize: 12,
                      )),
                  const SizedBox(height: 4),
                  entrarConCuenta,
                  const SizedBox(height: 32),
                  continuarCon
                ])),
          ],
        )
      ],
    );

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[registration1],
    )));
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference docRef =
          firestore.collection('users').doc(userCredential.user?.uid);

      await docRef.set({
        'email': userCredential.user?.email,
        'fullName': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
