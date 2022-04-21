import 'package:alquran/app/data/models/response_shalat.dart' as waktu;
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: marginDefault),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          0x19000000,
                        ),
                        offset: Offset(
                          3,
                          3,
                        ),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/illustrations/pray_time.jpg",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(marginDefault),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Zona waktu Jakarta",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? white : blackColor,
                        ),
                      ),
                      StreamBuilder(
                        stream: _clock(),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              "00:00:00",
                              style: GoogleFonts.poppins(
                                fontSize: 44,
                                fontWeight: FontWeight.w600,
                                color: isDarkMode ? white : blackColor,
                              ),
                            );
                          }
                          return Text(
                            snapshot.data!,
                            style: GoogleFonts.poppins(
                              fontSize: 44,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? white : blackColor,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            FutureBuilder<waktu.ResponseShalat>(
                future: controller.getPrayTime(),
                builder: (context, snapshot) {
                  waktu.Times? time =
                      snapshot.data?.results?.datetime?[0].times;
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
                      SholatCard(
                        time: time,
                        sholat: "Fajar",
                        icon: "subuh",
                        api: "${time?.fajr}",
                      ),
                      SholatCard(
                        time: time,
                        sholat: "Dzuhur",
                        icon: "dzuhur",
                        api: "${time?.dhuhr}",
                      ),
                      SholatCard(
                        time: time,
                        sholat: "Ashar",
                        icon: "ashar",
                        api: "${time?.asr}",
                      ),
                      SholatCard(
                        time: time,
                        sholat: "Maghrib",
                        icon: "maghrib",
                        api: "${time?.maghrib}",
                      ),
                      SholatCard(
                        time: time,
                        sholat: "Isya",
                        icon: "isya",
                        api: "${time?.isha}",
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class SholatCard extends StatelessWidget {
  const SholatCard({
    Key? key,
    required this.time,
    required this.sholat,
    required this.api,
    required this.icon,
  }) : super(key: key);

  final waktu.Times? time;
  final String sholat;
  final String api;
  final String icon;

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: Get.width,
      height: 50,
      margin: const EdgeInsets.all(marginDefault),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: marginDefault),
        child: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/$icon.svg",
              color: isDarkMode ? white : blackColor,
            ),
            const SizedBox(width: marginDefault),
            Text(
              sholat,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Text(api,
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? darkGrey : white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(
              0x19000000,
            ),
            offset: Offset(
              3,
              3,
            ),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }
}
