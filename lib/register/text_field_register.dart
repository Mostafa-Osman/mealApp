import 'package:flutter/material.dart';

class TextFieldRegister extends StatelessWidget {
  final String? textHint;
  final Icon? icon;
  final Color? textColor;
  final Color? hintColor;
  bool obscureText = false;
  final Widget? suffixIcon;
  final Color? background;

  TextFieldRegister(
      {this.textHint,
      this.icon,
      this.textColor,
      this.hintColor,
      required this.obscureText,
      this.suffixIcon,
      this.background});

  // const TextFieldRegister({
  //   required this.textColor,
  //   required this.textHint,
  //   required this.hintColor,
  //   required this.icon,
  //   this.obscureText = false,
  //   this.suffixIcon,
  //   this.background,
  // });

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: _size.width * 0.8,
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
