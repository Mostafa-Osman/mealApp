import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final String textHint;
  final Icon? icon;
  final Color textColor;
  final Color hintColor;
  final bool obscureText;
  final Widget suffixIcon;
  final Color background;

  TextFieldContainer(
      {required this.textHint,
      this.obscureText = false,
      this.icon,
      required this.suffixIcon,
      required this.textColor,
      required this.hintColor,
      required this.background});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(29),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        child: TextField(
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            hintText: textHint,
            hintStyle: TextStyle(color: hintColor),
            icon: icon,
            suffixIcon: suffixIcon,
          ),
          obscureText: obscureText,
        ),
      ),
    );
  }
}
