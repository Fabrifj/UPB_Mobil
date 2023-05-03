import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upb_mobil/static_resources/user_provider.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final UserProvider _userProvider;

  AuthenticationService(this._userProvider);

  Future createNewUser(
      String name, String email, String gender, String password) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential != null) {
        credential.user?.updateDisplayName(name);
        _firestore.collection('users').doc().set({
          'name': name,
          'gender': gender,
          'uid': credential.user?.uid,
          'email': credential.user?.email,
          'isEmailVerified':
              credential.user?.emailVerified, // will also be false
          'photoUrl': credential.user?.photoURL, // will always be null
        });
      }
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

// sign with email and password

  Future loginUser(String email, String password) async {
    try {
        final credential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        _userProvider.updateUser(credential.user);
        return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return null;

    }

  }

  Future signOut() async {
    await _auth.signOut();
    _userProvider.updateUser(null);

  }
}
