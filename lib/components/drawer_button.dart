import 'package:flutter/material.dart';

class DrawerButtons extends StatelessWidget {
  const DrawerButtons({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      alignment: Alignment.center,
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(Colors.grey.shade100)),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Color(0xFF300759)),
        ),
      ),
    );
  }
}
