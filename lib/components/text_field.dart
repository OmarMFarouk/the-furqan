// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField(
      {super.key,
      required this.hint,
      required this.isPassword,
      required this.hasIcon,
      required this.controller});
  final String hint;
  bool isPassword;
  final bool hasIcon;
  final TextEditingController controller;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      controller: widget.controller,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
          filled: true,
          suffixIcon: widget.hasIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isPassword = !widget.isPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye_rounded,
                    color: widget.isPassword ? Colors.black : Colors.blue,
                  ))
              : null,
          fillColor: const Color(0xffE5B6F2),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
