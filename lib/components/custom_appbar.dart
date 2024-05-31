import 'package:flutter/material.dart';

import '../src/data/app_navigator.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title, required this.icon});
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Image.asset(
                    'assets/images/back.png',
                    scale: 0.95,
                  ),
                  onTap: () => AppNavigator.pop(context),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.06,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff300759)),
                ),
              ],
            ),
            Image.asset(
              icon,
              scale: 0.95,
            ),
          ],
        ),
      ],
    );
  }
}
