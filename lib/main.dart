import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:our_portfolio/screens/homepage.dart';
import 'Controllers/contact_controller.dart';
import 'Controllers/theme_controller.dart';
import 'Controllers/typingtext_controller.dart';

void main() async {
  await GetStorage.init();
  Get.put(ContactController());
  Get.put(TypingTextController(
    lines: [
      'Want to Develop A Mobile Application or A Website?',
      'Looking for a Business Solution?',
      'We are just a Click Away!',
    ],
  ));
  await Get.putAsync(() async {
    final themeController = ThemeController();
    await themeController.init();
    return themeController;
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      builder: (controller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Saqib Portfolio',
          theme: ThemeData(),
          home: Homepage(),
        );
      },
    );
  }
}
