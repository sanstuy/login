import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:satu/login.dart';
import 'package:satu/main_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return MainPage();
        }else{
          return const Login();
        }
      });
  }
}