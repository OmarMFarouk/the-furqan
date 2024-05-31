import 'package:flutter/material.dart';

import '../screens/reading_screen.dart';
import '../services/shared_prefs.dart';

class AyahTile extends StatelessWidget {
  const AyahTile({super.key, required this.widget, required this.index});

  final ReadingScreen widget;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Localizations.localeOf(context).languageCode == "ar"
          ? Text(
              "${widget.arabicData.ayahs[index].text}",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color(0xff300759),
                  fontSize:
                      SharedPref.localStorage!.getDouble('fontSize') ?? 20),
            )
          : Text(
              widget.englishData.ayahs[index].text,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff484848),
                  fontSize:
                      SharedPref.localStorage!.getDouble('fontSize') ?? 20),
            ),
      subtitle: Localizations.localeOf(context).languageCode == "ar"
          ? Text(
              widget.englishData.ayahs[index].text,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Color(0xff484848), fontSize: 16),
            )
          : Text(
              "${widget.arabicData.ayahs[index].text}",
              textAlign: TextAlign.right,
              style: const TextStyle(color: Color(0xff300759), fontSize: 16),
            ),
    );
  }
}
