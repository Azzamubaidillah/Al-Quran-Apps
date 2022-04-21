import 'package:alquran/app/data/models/response_shalat.dart' as waktu;
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pray_time_controller.dart';

class PrayTimeView extends GetView<PrayTimeController> {
  final bool _running = true;
  Stream<String> _clock() async* {
    // This loop will run forever because _running is always true
    while (_running) {
      await Future<void>.delayed(const Duration(seconds: 1));
      DateTime _now = DateTime.now();
      // This will be displayed on the screen as current time
      yield "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrayTimeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<waktu.ResponseShalat>(
          future: controller.getPrayTime(),
          builder: (context, snapshot) {
            waktu.Times? time = snapshot.data?.results?.datetime?[0].times;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Tidak ada data"),
              );
            }
            return Column(
              children: [
                StreamBuilder(
                    stream: _clock(),
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return Text(
                        snapshot.data!,
                        style:
                            const TextStyle(fontSize: 50, color: Colors.blue),
                      );
                    }),
                Text("Subuh = ${time?.fajr}"),
                Text("Dzuhur = ${time?.dhuhr}"),
                Text("Ashar = ${time?.asr}"),
                Text("Maghrib = ${time?.maghrib}"),
                Text("Isya = ${time?.isha}"),
              ],
            );
          }),
    );
  }
}
