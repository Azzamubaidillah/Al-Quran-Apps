import 'package:alquran/app/modules/doa/views/doa_view.dart';
import 'package:alquran/app/modules/home/views/home_view.dart';
import 'package:alquran/app/modules/pray_time/views/pray_time_view.dart';
import 'package:alquran/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              const HomeView(),
              PrayTimeView(),
              DoaView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(
              0xffffffff,
            ),
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
              backgroundColor: white,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/quran.svg",
                    color: controller.tabIndex == 0 ? mainColor : greyColor,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/sholat.svg",
                    color: controller.tabIndex == 1 ? mainColor : greyColor,
                  ),
                  label: 'Waktu sholat',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/icons/doa.svg",
                    color: controller.tabIndex == 2 ? mainColor : greyColor,
                  ),
                  label: 'Doa',
                ),
              ]),
        ),
      );
    });
  }
}
