import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doa_controller.dart';

class DoaView extends GetView<DoaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DoaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DoaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
