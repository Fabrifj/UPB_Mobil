import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:upb_mobil/artefacts/auth_guard.dart';

import 'package:upb_mobil/pages/about_us/about_us_page.dart';
import 'package:upb_mobil/pages/events/events_page.dart';
import 'package:upb_mobil/pages/home/home_page.dart';
import 'package:upb_mobil/pages/login/login_page.dart';
import 'package:upb_mobil/pages/login/registration_page.dart';
import 'package:upb_mobil/pages/networking/networking_categories_page.dart';
import 'package:upb_mobil/texts/appStrings.dart';
import '../pages/networking/networking_search_page.dart';
import 'package:upb_mobil/pages/management/management_content.dart';
import '../pages/personal_info/personal_info_page.dart';

class Routes {
  static void defineRoutes(FluroRouter router) {
    router.define('/home', handler: _homeHandler);
    router.define('/', handler: _loginPage);
    router.define('/registration', handler: _registrationPage);
    router.define('/events', handler: _eventsPage);
    router.define('/networking-search/:id', handler: _networkingSerPage);
    router.define('/networking', handler: _networkingCatPage);
    router.define('/networking/person/:id', handler: _networkingPerPage);
    router.define('/persona-page', handler: _personalInfoPage);
    router.define('/about-us', handler: _aboutUsPage);
    router.define('/content-management', handler: _contentManagementPage);
    router.define('/login', handler: _loginPage);
  }

  static final Handler _homeHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> s) =>
          AuthGuard(child: HomePage(title: AppStrings.homeTitle)));

  static final Handler _loginPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          LoginPage());

  static final Handler _registrationPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          RegistrationPage(title: 'Registration'));

  static final Handler _eventsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          EventsPage(title: AppStrings.eventsTitle));

  static final Handler _networkingCatPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          NetworkingCategoriesPage(AppStrings.networkingTitle));

  static final Handler _networkingSerPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          NetworkingSearchPage(AppStrings.networkingTitle, params["id"][0]));

  static final Handler _networkingPerPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
          PersonalInfoPage(AppStrings.networkingTitle, params["id"][0] ,false));

  static final Handler _personalInfoPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          PersonalInfoPage(AppStrings.profileTitle, "12345" ,true));

  static final Handler _aboutUsPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          AboutUsPage(AppStrings.aboutUsTitle));

  static final Handler _contentManagementPage = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
          ManagementContent(title: 'ContentManagement'));
}

