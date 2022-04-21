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
      body: Center(
        child: Text(
          'PrayTimeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
