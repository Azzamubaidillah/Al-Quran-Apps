import 'package:alquran/app/data/models/surah.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

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
      body: FutureBuilder<List<Surah>>(
        future: controller.getAllSurah(),
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

          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: marginDefault),
                child: Divider(
                  color: greyColor,
                ),
              );
            },
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Surah surah = snapshot.data![index];
              return ListTile(
                onTap: () => Get.toNamed(Routes.DETAIL_SURAH, arguments: surah),
                leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset("assets/icons/avatar_number.svg"),
                    Text(
                      "${index + 1}",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                title: Text(
                  surah.name?.transliteration?.id ?? 'Error...',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "${surah.revelation!.id} | ${surah.numberOfVerses} Ayat",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: greyColor,
                  ),
                ),
                trailing: Text(
                  "${surah.name!.short}",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.amiri(
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    fontSize: 20,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
