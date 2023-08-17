import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:provider/provider.dart';


import 'package:upb_mobil/pages/home/home_page.dart';
import 'package:upb_mobil/routes/aplication.dart';
import 'package:upb_mobil/services/authentication_service.dart';
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
  bool _isLoading = false;

  void _toggleLoginForm() {
    setState(() {
      _showLoginForm = !_showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
  final authService = Provider.of<AuthenticationService>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    final laMejorAppPara = Center(
        child: Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Text(
              'La mejor app para contactarnos entre upbinos',
              style:
                  UpbTextStyle.getTextStyle('h3', ColorResourcees.p_Blue, 'n'),
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
    final crearCuenta = GestureDetector(
        onTap: () {
          Application.router.navigateTo(
            context,
            "registration",
            transition: TransitionType.inFromRight,
          );
        },// Refactorizar con colores y estilos adecuados
        child: Text('Crear tu cuenta',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-Bold',
              fontSize: 12,
            )));
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
        const SizedBox(height: 16),
        crearCuenta,
        const SizedBox(height: 96),
        continuarCon
      ],
    );
    final usuarioYContrasena = Column(children: [
      TextField(
          controller: _emailController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(51, 83, 230, 0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: 'E-mail')),
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
      )
    ]);
    final botonEntrar = ElevatedButton(
      onPressed: () {
        String user = _emailController.text;
        String password = _passwordController.text;
        if (user.isNotEmpty && password.isNotEmpty) {
          if(authService.loginUser(user, password) != null){
            Application.router.navigateTo(context, "events");
          }


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
      child:
          _isLoading ? const CircularProgressIndicator() : const Text('Entrar'),
    );
    final login2 =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 80),
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
              )
            ])),
        Container(
            width: size.width * 0.65,
            child: Column(children: [
              usuarioYContrasena,
              SizedBox(height: 16),
              Row(children: <Widget>[
                Checkbox(
                    fillColor:
                        MaterialStateProperty.all(ColorResourcees.s_Yellow),
                    value: false,
                    onChanged: (value) {}),
                const Text('Recordar mis datos',
                    style: TextStyle(
                      color: ColorResourcees.p_Blue,
                      fontFamily: 'Montserrat-Black',
                      fontSize: 10,
                    )),
                Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: const Text('Olvidé mi contraseña',
                        style: TextStyle(
                          color: ColorResourcees.p_Blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Bold',
                          fontSize: 12,
                        )))
              ])
            ])),
        SizedBox(height: 16),
        botonEntrar,
        SizedBox(height: 16),
        const Text('¿No tienes una cuenta?',
            style: TextStyle(
              color: ColorResourcees.s_Yellow,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-Bold',
              fontSize: 12,
            )),
        SizedBox(height: 4),
        crearCuenta,
        SizedBox(height: 32),
        continuarCon,
      ])
    ]);
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[!_showLoginForm ? login1 : login2],
    )));
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .get();
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    userData: userData,
                    title: "Home",
                  )),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('No user found with that email.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ]);
            });
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Wrong password provided for that user.'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'))
                  ]);
            });
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
