import 'package:flutter/material.dart';
import 'package:satu/register.dart';
import 'package:satu/auth_services.dart';
import 'constants/color_constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mBgColor,
      // Container adalah parent widget (widget induk)
      //berisikan berbagai child widget atau widget anak yang dapat mengaturnya dengan efisien melalui width, height, padding, background color, dan lain sebagainya.
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView(
          //biar bisa di scroll
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 90),
              //masukin gambar dari local
              child: Image.asset(
                'assets/images/logo.png',
                height: 150,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              child: const Text(
                'LABORATORIUM KOMPUTER',
                //text styling manual
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20.0, left: 30.0, right: 30),
              child: Column(
                children: <Widget>[
                  Form(
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          labelText: 'E-mail',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: merah))),
                    ),
                  ),
                  Form(
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Password',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: merah),
                          )),
                      obscureText: true,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: merah,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () async {
                    await AuthServices.signIn(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: const Text('Login'),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    },
                    child: Text("Belum Punya Akun?")))
          ],
        ),
      ),
    );
  }
}
