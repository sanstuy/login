// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(user.email!),
            ),
            ElevatedButton(
                onPressed: () => FirebaseAuth.instance.signOut(),
                child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
