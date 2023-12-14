import 'dart:convert';
import 'package:http/http.dart' as http;

class Ex {
  int id;
  String word;
  String meaning_capitalized;
  String romaji;

  Ex({
    required this.id,
    required this.word,
    required this.meaning_capitalized,
    required this.romaji,
  });

  factory Ex.fromJson(Map<String, dynamic> json) {
    return Ex(
      id: json['id'] ?? 0,
      word: json['word'] ?? '',
      meaning_capitalized: json['meaning_capitalized'] ?? '',
      romaji: json['romaji'] ?? '',
    );
  }
}

class Hiragana {
  int id;
  List<Ex> ex;
  String sound;
  String vowel;
  String hiragana;
  String kanaType;

  Hiragana({
    required this.id,
    required this.ex,
    required this.sound,
    required this.vowel,
    required this.hiragana,
    required this.kanaType,
  });

  factory Hiragana.fromJson(Map<String, dynamic> json) {
    var exList = json['ex'] as List;
    List<Ex> exData = exList.map((e) => Ex.fromJson(e)).toList();

    return Hiragana(
      id: json['id'] ?? 0,
      ex: exData,
      sound: json['sound'] ?? '',
      vowel: json['vowel'] ?? '',
      hiragana: json['hiragana'] ?? '',
      kanaType: json['kanaType'] ?? '',
    );
  }
}

class KanaTypes {
  int id;
  String kanaType;
  List<Hiragana> hiragana;

  KanaTypes({
    required this.id,
    required this.kanaType,
    required this.hiragana,
  });

  factory KanaTypes.fromJson(Map<String, dynamic> json) {
    var hiraganaList = json['hiragana'] as List;
    List<Hiragana> hiraganaData =
        hiraganaList.map((e) => Hiragana.fromJson(e)).toList();

    return KanaTypes(
      id: json['id'] ?? 0,
      kanaType: json['kanaType'] ?? '',
      hiragana: hiraganaData,
    );
  }
}

class ApiService {
  static Future<List<KanaTypes>> fetchData() async {
    final response = await http
        .get(Uri.parse('https://mardood.pythonanywhere.com/api/kanatypes/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse =
          json.decode(utf8.decode(response.bodyBytes));
      List<KanaTypes> kanaTypesList =
          jsonResponse.map((data) => KanaTypes.fromJson(data)).toList();
      return kanaTypesList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
