import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? color;
  final String? text;
  final Color? textColor;
  final Function? press;

   Button({ this.color, this.text, this.textColor, this.press});

  // const Button(
  //     {this.color = Colors.black,
  //     required this.text,
  //     this.textColor = Colors.white,
  //     required this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        child: FlatButton(
          color: color,
          child: Text(
            text!,
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          onPressed: () => press!(),
        ),
      ),
    );
  }
}
