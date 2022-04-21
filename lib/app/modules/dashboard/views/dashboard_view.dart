import 'package:alquran/app/modules/home/views/home_view.dart';
import 'package:alquran/app/modules/pray_time/views/pray_time_view.dart';
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              const HomeView(),
              PrayTimeView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(
                  0x33b9b0ce,
                ),
                offset: Offset(
                  0,
                  -4,
                ),
                blurRadius: 16,
              ),
            ],
          ),
          child: BottomNavigationBar(
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex,
              selectedItemColor: mainColor,
              backgroundColor: isDarkMode ? darkBackground : white,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/quran.svg",
                    color: controller.tabIndex == 0 ? mainColor : greyColor,
                  ),
                  label: "Qur'an",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/sholat.svg",
                    color: controller.tabIndex == 1 ? mainColor : greyColor,
                  ),
                  label: 'Waktu sholat',
                ),
              ]),
        ),
      );
    });
  }
}
