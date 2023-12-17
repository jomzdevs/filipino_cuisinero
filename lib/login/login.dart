import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:filipino_cuisinero/login/buttons.dart';

import 'package:filipino_cuisinero/utils/auth.dart';
import 'package:filipino_cuisinero/login/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthUser();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/logo_full.svg',
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 100),
                  child: SizedBox(
                    width: 300,
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
                      ],
                    ),
                  ),
                ),
                Wrap(
                  spacing: 15,
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ButtonFill(
                        label: "Login",
                        onPress: (email.isNotEmpty && password.isNotEmpty)
                            ? () {
                                if (email.isNotEmpty && password.isNotEmpty) {
                                  _auth.login(
                                      email: email.toString(),
                                      password: password.toString());

                                  if (_auth.user != null) {
                                    Navigator.pushNamed(context, "home");
                                  }
                                }
                              }
                            : null),
                    const ButtonText(
                      label: "Sign up",
                      route: 'signup',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
