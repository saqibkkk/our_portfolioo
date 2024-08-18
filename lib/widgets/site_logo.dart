import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/theme_controller.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
          return GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Image.asset('assets/logo/logo_appbar.png'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'PORTFOLIO',
                  style: TextStyle(
                      color: theme.scaffolBg.value,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                  letterSpacing: 5),
                )
              ],
            ),
          );
        });
  }
}
