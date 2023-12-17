import 'package:flutter/material.dart';

class ButtonFill extends StatelessWidget {
  final dynamic onPress;
  final String label;

  const ButtonFill({Key? key, required this.onPress, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.lightGreen.shade600,
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPress,
      child: SizedBox(
          width: 150,
          child: Text(
            label,
            textAlign: TextAlign.center,
          )),
    );
  }
}

class ButtonText extends StatelessWidget {
  final String label;
  final String route;
  const ButtonText({Key? key, required this.label, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade700),
      ),
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
