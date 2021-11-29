import '../register/text_field_register.dart';
import '../screens/components/button.dart';
import '../screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BodyRegister extends StatefulWidget {
  @override
  _BodyRegisterState createState() => _BodyRegisterState();
}

class _BodyRegisterState extends State<BodyRegister> {
  bool visiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //design background of page (container)
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
          //background color
          color: Colors.black38,
          //shape of background (container)
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(120),
              bottomLeft: Radius.circular(120)),
        ),
        child: Column(
          children: [
            // text sign up
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Sign UP!",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 36),
            // object of textFieldRegister to make text field (take name of user)
            TextFieldRegister(
              obscureText: false,
              // background color of text field
              background: Colors.white,
              //color of text
              textColor: Colors.black,
              //text displayed before user write
              textHint: "Name",
              // color of hint text
              hintColor: Colors.redAccent,
              //icon beside text field
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            //another text field for email
            TextFieldRegister(
              background: Colors.white,
              textColor: Colors.black,
              textHint: "Email",
              hintColor: Colors.redAccent,
              icon: Icon(Icons.email_outlined, color: Colors.blue),
              obscureText: false,
            ),
            SizedBox(height: 10),
            //another text field for password

            TextFieldRegister(
              background: Colors.white,
              textColor: Colors.black,
              textHint: "password",
              hintColor: Colors.redAccent,
              icon: Icon(Icons.lock, color: Colors.blue),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visiblePassword = !visiblePassword;
                  });
                },
                icon: Icon(visiblePassword == true
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
              obscureText: visiblePassword == true ? false : true,
            ),

            SizedBox(height: 30),
            // button create account
            SizedBox(
              width: 200,
              child: Button(
                press: () => Navigator.of(context).pop(),
                text: "Create Account ",
                textColor: Colors.black,
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 30),
            //text already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account?",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                //GestureDetector action when click in text sign in
                GestureDetector(
                  child: Text(
                    " sign In",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            //sign in with facebook or twitter or google plus
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                option("assets/icons/facebook.svg", () {}, Colors.white),
                option("assets/icons/googlePlus.svg", () {}, Colors.white),
                option("assets/icons/twitter.svg", () {}, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget option(String url, Function press, Color color) {
  return GestureDetector(
    onTap: press(),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          /*border: Border.all(width: 1),*/
          shape: BoxShape.circle,
          color: color),
      child: SvgPicture.asset(
        url,
        height: 30,
        width: 30,
      ),
    ),
  );
}
