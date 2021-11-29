import 'package:again/database/dummy_data.dart';
import 'package:again/models/meal.dart';
import 'package:again/register/register.dart';
import 'package:again/screens/components/button.dart';
import 'package:again/screens/components/tabs_screen.dart';
import 'package:again/screens/login/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visiblePassword = false;

  //mostafa: must change it by using provider
//use this method to change icons star
  List<Meal> _favouriteMeals = [];

  bool isMealFavourite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }
  //find meal favourite and add or delete it
  void _toggleFavourite(String mealId) {
    final existingIndex =
    _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0)
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
              //design in bottom right of page (image)
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  "assets/images/login.png",
                  width: size.width * 0.2,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //text login
                  Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  //icons
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.45,
                  ),

                  // TextFieldContainer to take user name email
                  TextFieldContainer(
                    textColor: Colors.black,
                    textHint: "Your Email",
                    background: Color.fromRGBO(153, 51, 255, 1),
                    hintColor: Colors.white,
                    suffixIcon: Icon(
                      Icons.account_circle,
                      color: Color.fromRGBO(0, 0, 128, 1),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  // TextFieldContainer to take password from user
                  TextFieldContainer(
                    textColor: Colors.black,
                    textHint: "Your password",
                    hintColor: Colors.white,
                    background: Color.fromRGBO(220, 153, 255, 1),
                    icon: Icon(
                      Icons.lock,
                      color: Color.fromRGBO(0, 0, 128, 1),
                    ),
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

                  //button login
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: size.width * .45,
                    height: size.height * 0.08,
                    child: Button(
                      text: "Login",
                      color: Colors.deepPurple,
                      press: () => TabsScreen(_favouriteMeals),
                    ),
                  ),
                  //GestureDetector action when click in text forget password ?
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "forget password ?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  //GestureDetector action when click in text sign up

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                        child: Text(
                          " sign Up",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
