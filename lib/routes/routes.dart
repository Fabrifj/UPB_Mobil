import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:upb_mobil/artefacts/auth_guard.dart';

import 'package:upb_mobil/pages/about_us/about_us_page.dart';
import 'package:upb_mobil/pages/home/home_page.dart';
import 'package:upb_mobil/pages/login/login_page.dart';
import 'package:upb_mobil/pages/login/registration_page.dart';
import 'package:upb_mobil/pages/networking/networking_page.dart';
import 'package:upb_mobil/pages/programs/programs_page.dart';
import 'package:upb_mobil/texts/appStrings.dart';
import 'package:upb_mobil/pages/management/management_content.dart';

import '../pages/networking/user_profile_list.dart';
import '../pages/personal_info/user_profile.dart';

class Routes {
  static void defineRoutes(FluroRouter router) {
    router.define('/', handler: _loginPage);
    router.define('/registration', handler: _registrationPage);
    router.define('/events', handler: _eventsPage);
    router.define('/networking-search/:id', handler: _networkingSerPage);
    router.define('/networking', handler: _networkingCatPage);
    router.define('/networking/person/:id', handler: _networkingPerPage);
    router.define('/persona-page/:id', handler: _personalInfoPage);
    router.define('/about-us', handler: _aboutUsPage);
    router.define('/content-management', handler: _contentManagementPage);
    router.define('/login', handler: _loginPage);
  }


  static final Handler _homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return AuthGuardWidget(child: HomePage(title: 'Home'));
    },
  );
  static final Handler _loginPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          LoginPage());

  static final Handler _registrationPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          RegistrationPage());

  static final Handler _eventsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          ProgramsPage(title: AppStrings.eventsTitle));

  static final Handler _networkingCatPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          NetworkingPage(AppStrings.networkingTitle));

  static final Handler _networkingSerPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          UserProfileList(AppStrings.networkingTitle, params["id"][0]));

  static final Handler _networkingPerPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          UserProfile(userUid: params["id"][0], canEdit: false, title: AppStrings.profileTitle));

  static final Handler _personalInfoPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          UserProfile(userUid:  params["id"][0], canEdit: true, title: AppStrings.profileTitle));


  static final Handler _aboutUsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          AboutUsPage(AppStrings.aboutUsTitle));

  static final Handler _contentManagementPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          ManagementContent(title: 'ContentManagement'));
}
