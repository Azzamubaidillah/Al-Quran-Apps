import 'package:alquran/app/data/models/detail_surah.dart' as detail;
import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  final Surah surah = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quro',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: Get.width,
                  child: Image.asset(
                    "assets/illustrations/detail_illustrations.png",
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      surah.name?.transliteration?.id ?? 'Error...',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ),
                    Text(
                      surah.name?.translation?.id ?? 'Error...',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: marginDefault * 6,
                          vertical: marginDefault),
                      child: Divider(
                        thickness: 2,
                        color: white,
                      ),
                    ),
                    Text(
                      "${surah.revelation!.id} | ${surah.numberOfVerses} Ayat"
                          .toUpperCase(),
                      style: GoogleFonts.poppins(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: marginDefault),
                    SvgPicture.asset("assets/icons/bismillah.svg"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: marginDefault,
            ),
            FutureBuilder<detail.DetailSurah>(
              future: controller.getDetailSurah(surah.number.toString()),
              builder: (context, snapshot) {
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
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: surah.numberOfVerses,
                  itemBuilder: (context, index) {
                    detail.Verse? ayat = snapshot.data?.verses?[index];

                    index = index + 1;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: marginDefault / 2,
                        horizontal: marginDefault,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/avatar_number.svg"),
                                  Text(index.toString()),
                                ],
                              ),
                              SizedBox(
                                width: Get.width * 0.6,
                                child: Text(
                                  "${ayat?.text?.arab}",
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.amiri(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: marginDefault * 1.5),
                          Text(
                            "${ayat?.translation?.id}",
                            style: GoogleFonts.poppins(
                              color: greyColor,
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
