import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thefurqan/screens/auth/login_screen.dart';
import 'package:thefurqan/screens/auth/register_screen.dart';
import 'package:thefurqan/screens/home_screen.dart';

// ignore: must_be_immutable
class AuthToggle extends StatefulWidget {
  const AuthToggle({super.key});

  @override
  State<AuthToggle> createState() => _AuthToggleState();
}

class _AuthToggleState extends State<AuthToggle> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FirebaseAuth.instance.currentUser == null
        ? showSignIn
            ? LoginScreen(authToggle: toggleView)
            : RegisterScreen(authToggle: toggleView)
        : HomeScreen();
  }
}
