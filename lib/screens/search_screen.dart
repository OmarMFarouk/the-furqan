import 'package:flutter/material.dart';
import 'package:thefurqan/components/custom_appbar.dart';

import '../../generated/l10n.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

TextEditingController controller = TextEditingController();

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDAD0E1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyAppBar(
              title: S.of(context).search,
              icon: 'assets/images/search.png',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFE5B6F2),
                ),
                child: const TextField(
                  decoration: InputDecoration(border: InputBorder.none),
                )),
          ],
        ),
      ),
    );
  }
}
