// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  final TextEditingController controller;

  const MySearchBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    var hint;
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.035,
      child: TextField(
        cursorHeight: 23,
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        decoration: InputDecoration(
            hintText: 'search',
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            filled: true,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            fillColor: const Color(0xffE5B6F2),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
