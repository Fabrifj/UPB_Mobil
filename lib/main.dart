import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upb_mobil/services/authentication_service.dart';
import 'package:upb_mobil/static_resources/user_provider.dart';
import 'package:provider/provider.dart';

import 'routes/aplication.dart';
import 'routes/routes.dart';
import 'services/firebase_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseConfiguration.android);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    final router = FluroRouter();
    Routes.defineRoutes(router);
    Application.router = router;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ProxyProvider<UserProvider, AuthenticationService>(
          update: (context, userProvider, _) => AuthenticationService(userProvider),
        ),
      ],
      child: MaterialApp(
        title: 'UPB Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.windows: ZoomPageTransitionsBuilder(),
            },
          ),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
