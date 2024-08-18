import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../Controllers/theme_controller.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Text(
          'Made by Saqib, with Love & Tea 😉❤️.',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color:
              theme.theme == '1'
              ?theme.textLight.value
              :theme.bgLight2.value),
        ),
      );
    });
  }
}
