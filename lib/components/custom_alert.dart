import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';

import '../generated/l10n.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.ifText,
    required this.elseText,
    required this.ifContentText,
    required this.elseContentText,
  });
  final String ifText;
  final String elseText;
  final String ifContentText;
  final String elseContentText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(S.of(context).okay),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Share.share(
                Localizations.localeOf(context).languageCode == "en"
                    ? ifText
                    : elseText,
              );
            },
            child: Text(S.of(context).share),
          ),
        ],
        title: Text(
          S.of(context).interpretation,
          style: const TextStyle(fontSize: 20),
        ),
        insetAnimationCurve: Curves.easeInOut,
        insetAnimationDuration: const Duration(seconds: 3),
        content: Text(
          Localizations.localeOf(context).languageCode == "en"
              ? ifContentText
              : elseContentText,
          textDirection: TextDirection.rtl,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ));
  }
}
