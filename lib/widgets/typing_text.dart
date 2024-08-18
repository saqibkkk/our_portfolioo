import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/typingtext_controller.dart';
import '../Controllers/theme_controller.dart';

class TypingTextSwitcher extends StatelessWidget {
  final TypingTextController controller;
  final TextStyle textStyle;

  TypingTextSwitcher({required this.controller, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      id: '0',
      builder: (theme) {
        return Obx(() {
          return Text(
            controller.displayedText.value,
            style: textStyle,
          );
        });
      },
    );
  }
}
