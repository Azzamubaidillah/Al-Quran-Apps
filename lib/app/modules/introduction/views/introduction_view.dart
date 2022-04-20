import 'package:alquran/app/routes/app_pages.dart';
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Quran App",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Learn Quran and\nRecite once everyday",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: greyColor,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: Get.width,
                child:
                    SvgPicture.asset("assets/illustrations/introduction.svg"),
              ),
              InkWell(
                onTap: () {
                  Get.offAllNamed(Routes.HOME);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: marginDefault, horizontal: marginDefault * 2),
                  decoration: BoxDecoration(
                    color: orangeColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Get started",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: blackColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
