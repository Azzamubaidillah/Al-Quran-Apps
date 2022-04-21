import 'dart:convert';
import 'package:alquran/app/data/models/detail_surah.dart';
import 'package:alquran/app/data/models/response_shalat.dart';
import 'package:alquran/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse("https://api.pray.zone/v2/times/today.json?city=jakarta");
  var res = await http.get(url);

  Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);

  //raw data dari api ke model
  ResponseShalat waktuSholat = ResponseShalat.fromJson(data);
  print(waktuSholat.results?.datetime?[0].times?.asr);
  //print(surahAnnas.name?.transliteration?.id);

  // Uri urlAnnas =
  //     Uri.parse("https://api.quran.sutanlab.id/surah/${surahAnnas.number}");
  // var resAnnas = await http.get(urlAnnas);

  // Map<String, dynamic> dataAnnas =
  //     (jsonDecode(resAnnas.body) as Map<String, dynamic>)["data"];

  // DetailSurah annas = DetailSurah.fromJson(dataAnnas);

  // print(annas.verses![0].text!.arab);
}
