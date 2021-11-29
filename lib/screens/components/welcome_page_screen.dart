import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body_welcome_Screen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WelcomeScreen(),
    );
  }
}
