import 'package:alquran/app/data/models/response_shalat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pray_time_controller.dart';

class PrayTimeView extends GetView<PrayTimeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrayTimeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<ResponseShalat>(
          future: controller.getPrayTime(),
          builder: (context, snapshot) {
            Times? time = snapshot.data?.results?.datetime?[0].times;
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
