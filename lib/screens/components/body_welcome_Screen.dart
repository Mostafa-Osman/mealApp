import 'package:again/models/meal.dart';
import 'package:again/register/register.dart';
import 'package:again/screens/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'button.dart';



//first page
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //global size
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            //design in top left of page (image)
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_top.png",
                width: size.width * 0.3,
              ),
            ),
            //design in bottom left of page (image)
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                "assets/images/main_bottom.png",
                width: size.width * 0.2,
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //text Welcome Back
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                //icons
                SvgPicture.asset(
                  "assets/icons/chat.svg",
                  height: size.height * 0.45,
                ),

                SizedBox(
                  height: size.height * 0.05,
                ),

                // login button
                Button(
                  color: Colors.purple,
                  text: "Login",
                  textColor: Colors.white,
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),

                //Register button
                Button(
                  color: Colors.purple,
                  text: "Register",
                  textColor: Colors.white,
                  press: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
