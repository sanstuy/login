// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<Void> signOut() async {
    _auth.signOut();

    return signOut();
  }

  static Future signIn(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Email tidak ditemukan');
      } else if (e.code == 'wrong-password') {
        print('Password salah');
      }
    }
  }

  static Future createUser(emailAddress, password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
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
}
