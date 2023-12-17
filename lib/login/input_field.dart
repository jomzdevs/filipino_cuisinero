import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final dynamic onChange;
  final String label;
  final bool isObscure;

  const InputField(
      {Key? key,
      required this.onChange,
      required this.label,
      this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLength: 30,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(color: Colors.green),
          counterText: "",
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 15,
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1.2,
              color: Colors.green,
            ),
          ),
        ),
        obscureText: isObscure,
        onChanged: onChange);
  }
}
