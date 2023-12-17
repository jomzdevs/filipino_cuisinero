// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:filipino_cuisinero/login/buttons.dart';

import 'package:filipino_cuisinero/utils/auth.dart';
import 'package:filipino_cuisinero/login/input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = AuthUser();
  String email = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Wrap(
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                spacing: 50,
                direction: Axis.vertical,
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/logo_full.svg',
                    height: 200,
                  ),
                  SizedBox(
                    width: 290,
                    child: Wrap(
                      runSpacing: 20,
                      children: [
                        InputField(
                          onChange: (input) {
                            setState(() {
                              email = input;
                            });
                          },
                          label: "Email",
                        ),
                        InputField(
                            onChange: (input) {
                              setState(() {
                                password = input;
                              });
                            },
                            label: "Password",
                            isObscure: true),
                        InputField(
                            onChange: (input) {
                              setState(() {
                                password = input;
                              });
                            },
                            label: "Confirm Password",
                            isObscure: true),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Wrap(
                      spacing: 15,
                      direction: Axis.vertical,
                      runAlignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ButtonFill(
                            label: "Sign up",
                            onPress: (email.isNotEmpty && password.isNotEmpty)
                                ? () async {
                                    if (email.isNotEmpty &&
                                        password.isNotEmpty) {
                                      bool pass = await _auth.signin(
                                          email: email, password: password);

                                      if (pass) {
                                        if (context.mounted) {
                                          Navigator.pushNamed(context, "login");
                                        }
                                      }
                                    }
                                  }
                                : null),
                        ButtonText(
                          label: "Login",
                          route: 'login',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
