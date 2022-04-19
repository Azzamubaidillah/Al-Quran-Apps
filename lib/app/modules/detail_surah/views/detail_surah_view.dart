import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailSurahView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailSurahView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
