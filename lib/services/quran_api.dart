import 'dart:convert';

import 'package:flutter/services.dart';

class QuranApi {
  Future fetchQuran() async {
    String response = await rootBundle.loadString('assets/json/quran.json');

    Map<String, dynamic> data = jsonDecode(response);
    print(data);

    return data;
  }

  Future fetchEnglishQuran() async {
    String response =
        await rootBundle.loadString('assets/json/quran_english.json');

    Map<String, dynamic> data = jsonDecode(response);
    print(data);

    return data;
  }

  Future fetchTafseer() async {
    String response = await rootBundle.loadString('assets/json/tafseer.json');

    Map<String, dynamic> data = jsonDecode(response);
    print(data);

    return data;
  }

  Future fetchEnglishTafseer() async {
    String response =
        await rootBundle.loadString('assets/json/tafseer_en.json');

    Map<String, dynamic> data = jsonDecode(response);
    print(data);

    return data;
  }
}
