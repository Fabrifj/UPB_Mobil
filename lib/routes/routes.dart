import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:upb_mobil/pages/about_us/about_us_page.dart';
import 'package:upb_mobil/pages/events/events_page.dart';
import 'package:upb_mobil/pages/home/home_page.dart';
import 'package:upb_mobil/pages/login/login_page.dart';
import 'package:upb_mobil/pages/login/registration_page.dart';
import 'package:upb_mobil/pages/networking/networking_page.dart';
import 'package:upb_mobil/pages/personal_info/personal_info_page.dart';



class Routes {
  static void defineRoutes(FluroRouter router) {
    router.define("/", handler: _homeHandler);
    router.define('/login', handler: _loginPage);
    router.define('/registration', handler: _registrationPage);
    router.define('/events', handler: _eventsPage);
    router.define('/networking', handler: _networkingPage);
    router.define('/persona_page', handler: _personalInfoPage);
    router.define('/about-us', handler: _aboutUsPage);
  }

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>>s) =>
          const HomePage(title: 'Flutter Demo Home Page'));

  static final Handler _loginPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          LoginPage());

  static final Handler _registrationPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          RegistrationPage());

  static final Handler _eventsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          EventsPage());

  static final Handler _networkingPage = Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params)
      => NetworkingPage());

  static final Handler _personalInfoPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          PersonalInfoPage());

  static final Handler _aboutUsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          AboutUsPage());

}