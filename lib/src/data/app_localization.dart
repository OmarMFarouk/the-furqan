import 'package:flutter/material.dart';

class Language {
  final String name;
  final String flag;
  final String languageCode;
  Language(this.name, this.flag, this.languageCode);
  static List<Language> languageList() {
    return <Language>[
      Language("English", "en", "en"),
      Language("Arabic", "ar", "ar"),
    ];
  }
}

const String ENGLISH = "en";
const String ARABIC = "ar";

//Function for selecting the language from the given option
Locale changeLanguage(Language language, context) {
  Locale _a;
  switch (language.languageCode) {
    case ENGLISH:
      _a = Locale(language.languageCode, "en");
      break;
    case ARABIC:
      _a = Locale(language.languageCode, "ar");
      break;

    default:
      _a = Locale(language.languageCode, 'US');
  }
  return _a;
}
