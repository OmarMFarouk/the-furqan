class TafseerModel {
  List<Surahs>? surahs;

  TafseerModel({this.surahs});

  TafseerModel.fromJson(Map<String, dynamic> json) {
    if (json['surahs'] != null) {
      surahs = <Surahs>[];
      json['surahs'].forEach((v) {
        surahs!.add(Surahs.fromJson(v));
      });
    }
  }
}

class Surahs {
  List<Data>? data;

  Surahs({this.data});

  Surahs.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? model;
  int? pk;
  Fields? fields;

  Data({this.model, this.pk, this.fields});

  Data.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields = json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }
}

class Fields {
  int? tafseer;
  int? ayah;
  String? text;

  Fields({this.tafseer, this.ayah, this.text});

  Fields.fromJson(Map<String, dynamic> json) {
    tafseer = json['tafseer'];
    ayah = json['ayah'];
    text = json['text'];
  }
}
