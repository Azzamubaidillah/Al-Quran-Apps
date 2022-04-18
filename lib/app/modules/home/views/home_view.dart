import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            child: Text("${index + 1}"),
          ),
          title: Text("Surah Al - ...."),
          subtitle: Text("7 Ayat | Mekah"),
          trailing: Text("Tulisan Arab"),
        ),
      ),
    );
  }
}
