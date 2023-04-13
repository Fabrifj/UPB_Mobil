import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserProvider with ChangeNotifier {
  User? _user;

  User? get user => _user;

  void updateUser(User? newUser) {
    _user = newUser;
    notifyListeners();
  }
}
