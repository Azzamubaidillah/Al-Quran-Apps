import 'dart:convert';

import 'package:alquran/app/data/models/response_shalat.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrayTimeController extends GetxController {
  Future<ResponseShalat> getPrayTime() async {
    Uri url =
        Uri.parse("https://api.pray.zone/v2/times/today.json?city=jakarta");
    var res = await http.get(url);

    Map<String, dynamic> data = (json.decode(res.body) as Map<String, dynamic>);

    return ResponseShalat.fromJson(data);
  }
}
