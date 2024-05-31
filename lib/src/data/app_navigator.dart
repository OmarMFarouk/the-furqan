import 'package:flutter/material.dart';

class AppNavigator {
  static pop(
    BuildContext context,
  ) {
    return Navigator.pop(context);
  }

  static push(BuildContext context, Widget destination) {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => destination,
        ));
  }

  static pushR(BuildContext context, Widget destination) {
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => destination,
        ));
  }
}
