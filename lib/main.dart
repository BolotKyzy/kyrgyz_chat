import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kgchat/app/modules/authentication/authentication_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AuthenticationBinding(),
    ),
  );
}
