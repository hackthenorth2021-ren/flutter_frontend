// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:email_validator/email_validator.dart';

import 'home.dart';

const kPrussian = Color(0xFF12263A);
const kBGreen = Color(0xFF06BCC1);
const kOpal = Color(0xFFC5D8D1);
const kIsabel = Color(0xFFF4EDEA);
const kOrange = Color(0xFFF4D1AE);

const users = {
  'test@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  Widget _buildEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        decoration: const InputDecoration(
            //contentPadding: const EdgeInsets.all(0),
            isDense: true,
            hintText: "Email"),
        validator: (value) => !EmailValidator.validate(value ?? '')
            ? "Please enter a valid email"
            : null,
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          //contentPadding: const EdgeInsets.only(0),
          isDense: true,
          hintText: 'Password',
        ),
        controller: _passwordController,
        validator: (value) => value!.length <= 6
            ? "Password must be 6 or more characters in length"
            : null,
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      width: MediaQuery.of(context).size.width * 0.45,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          backgroundColor: MaterialStateProperty.all(kPrussian),
        ),
        child: const Text(
          "Login",
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                'assets/sadge.jpg',
                height: 80,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            //Text("thank you elon, very cool"),
            //Container(
            //  margin: EdgeInsets.only(left: 50),
            //  child: Align(
            //    alignment: Alignment.centerLeft,
            //    child: Text(
            //      'Login',
            //      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            //    ),
            //  ),
            //),
            SizedBox(
              height: 8,
            ),
            _buildEmail(),
            _buildPassword(),
            //_buildConfirmPassword(),
            _buildSignUpButton(context),
            TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(kPrussian),
                ),
                onPressed: () => {},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Login with  '),
                      FaIcon(FontAwesomeIcons.google)
                    ])),
          ],
        ),
      ),
    ));
  }
}
