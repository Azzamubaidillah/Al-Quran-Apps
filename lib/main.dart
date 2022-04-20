import 'package:alquran/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    FutureBuilder(
      builder: (context, snapshot) {
        return GetMaterialApp(
          title: "Application",
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
