class TafseerEnglishModel {
  List<Surahs>? surahs;

  TafseerEnglishModel({this.surahs});

  TafseerEnglishModel.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahs = <Surahs>[];
      json['surahs'].forEach((v) {
        surahs!.add(new Surahs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.surahs != null) {
      data['surahs'] = this.surahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Surahs {
  List<Data>? data;

  Surahs({this.data});

  Surahs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Ayahs>? ayahs;

  Data({this.ayahs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['ayahs'] != null) {
      ayahs = <Ayahs>[];
      json['ayahs'].forEach((v) {
        ayahs!.add(new Ayahs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ayahs != null) {
      data['ayahs'] = this.ayahs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ayahs {
  int? ayah;
  int? surah;
  String? text;

  Ayahs({this.ayah, this.surah, this.text});

  Ayahs.fromJson(Map<String, dynamic> json) {
    ayah = json['ayah'];
    surah = json['surah'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ayah'] = this.ayah;
    data['surah'] = this.surah;
    data['text'] = this.text;
    return data;
  }
}
