import 'dart:convert';

import 'package:flutter/services.dart';

class QuranApi {
  Future fetchQuran() async {
    String response = await rootBundle.loadString('images/quran.json');

    Map<String, dynamic> data = jsonDecode(response);
    print(data);

    return data;
  }
}
