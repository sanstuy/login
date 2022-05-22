import 'package:flutter/material.dart';
import 'package:satu/auth_services.dart';
import 'package:satu/main_page.dart';
import 'constants/color_constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

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
                    key: _form,
                    child: Column(children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            labelText: 'E-mail',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: merah))),
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                            labelText: 'Password',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: merah),
                            )),
                        obscureText: true,
                      ),
                      TextFormField(
                        controller: passwordConfirmationController,
                        decoration: const InputDecoration(
                            labelText: 'Password Confirmation',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: merah),
                            )),
                        obscureText: true,
                        validator: (val) {
                          if (val != passwordController.text) {
                            return 'Password Tidak Sama!';
                          }
                          return null;
                        },
                      ),
                    ]),
                  ),
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
                    if (_form.currentState!.validate()) {
                      await AuthServices.createUser(emailController.text.trim(),
                              passwordController.text.trim())
                          .then((value) => Navigator.pop(context));
                    }
                  },
                  child: const Text('Register'),
                )),
          ],
        ),
      ),
    );
  }
}
