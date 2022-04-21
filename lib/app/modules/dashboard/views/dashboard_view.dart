import 'package:alquran/app/modules/doa/views/doa_view.dart';
import 'package:alquran/app/modules/home/views/home_view.dart';
import 'package:alquran/app/modules/pray_time/views/pray_time_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              HomeView(),
              DoaView(),
              PrayTimeView(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.sportscourt),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.bell),
                label: 'Alerts',
              ),
            ]),
      );
    });
  }
}
