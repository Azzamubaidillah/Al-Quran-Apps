import 'package:alquran/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sesibuk itukah kamu,\n sampai belum membaca quran?",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Image.network(
                  "https://www.kindpng.com/picc/m/204-2048251_vector-illustration-of-islamic-muslim-koran-or-quran.png"),
              SizedBox(
                width: Get.width / 1.8,
                child: ElevatedButton(
                  onPressed: () => Get.offAllNamed(Routes.HOME),
                  child: const Text("Get started"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
