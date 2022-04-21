import 'package:alquran/app/data/models/response_shalat.dart' as waktu;
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  "assets/illustrations/pray_time.jpg",
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(marginDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pray time",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                    StreamBuilder(
                        stream: _clock(),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          }
                          return Text(
                            snapshot.data!,
                            style: GoogleFonts.poppins(
                              fontSize: 44,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    )

        // FutureBuilder<waktu.ResponseShalat>(
        //     future: controller.getPrayTime(),
        //     builder: (context, snapshot) {
        //       waktu.Times? time = snapshot.data?.results?.datetime?[0].times;
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       if (!snapshot.hasData) {
        //         return const Center(
        //           child: Text("Tidak ada data"),
        //         );
        //       }
        //       return Column(
        //         children: [

        //         ],
        //       );
        //     }),
        );
  }
}
