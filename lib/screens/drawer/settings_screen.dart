import 'package:flutter/material.dart';
import 'package:thefurqan/components/custom_appbar.dart';
import 'package:thefurqan/services/shared_prefs.dart';

import '../../generated/l10n.dart';
import '../../src/app_root.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              title: S.of(context).settings,
              icon: 'assets/images/icon_settings.png',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              S.of(context).font,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF300759),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Color(0xFFE5B6F2),
              ),
              child: Text(
                "﻿بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                style: TextStyle(
                    fontSize:
                        SharedPref.localStorage!.getDouble('fontSize') ?? 16),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(223, 18, 25, 49),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                width: double.infinity,
                height: 50,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slider(
                        min: 14,
                        max: 22,
                        value: SharedPref.localStorage!.getDouble('fontSize') ??
                            16,
                        onChanged: (value) {
                          setState(() {
                            SharedPref.localStorage!
                                .setDouble('fontSize', value);
                          });
                        }))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              S.of(context).appLang,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF300759),
              ),
            ),
            DropdownMenu(
              trailingIcon: const Icon(Icons.language),
              inputDecorationTheme: const InputDecorationTheme(
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                color: Color.fromARGB(223, 18, 25, 49),
              ))),
              width: MediaQuery.of(context).size.width * 0.9,
              onSelected: (value) {
                if (value == 1) {
                  AppRoot.setLocale(context, const Locale('ar'));
                } else if (value == 2) {
                  AppRoot.setLocale(context, const Locale('en'));
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(
                  value: 1,
                  label: 'اللغة العربية',
                  labelWidget: Text(
                    'اللغة العربية',
                  ),
                ),
                DropdownMenuEntry(
                  value: 2,
                  label: 'English',
                  labelWidget: Text("English"),
                )
              ],
              hintText: S.of(context).choose,
            ),
          ],
        ),
      ),
    );
  }
}
