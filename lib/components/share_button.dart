import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton(
      {super.key,
      required this.index,
      required this.ifText,
      required this.elseText});

  final int index;
  final String ifText;
  final String elseText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Share.share(
          Localizations.localeOf(context).languageCode == "en"
              ? ifText
              : elseText,
        );
      },
      child: const Icon(
        Icons.share_outlined,
        color: Color(0xffA44AFF),
        size: 30,
      ),
    );
  }
}
