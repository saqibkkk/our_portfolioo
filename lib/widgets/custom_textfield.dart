import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/theme_controller.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    this.maxLine = 1,
    this.hintText,
    this.icon,
    this.size,
  });

  final TextEditingController? controller;
  final int maxLine;
  final String? hintText;
  final IconData? icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller,
                maxLines: maxLine,
                cursorColor: theme.theme == '1'
                    ? theme.textLight.value
                    : theme.textDark.value,
                style: TextStyle(
                  color: theme.theme == '1' || theme.theme == '7'
                      ? theme.textLight.value
                      : theme.textDark.value,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  filled: true,
                  fillColor: theme.bgLight1.value,
                  focusedBorder: getInputBorder,
                  enabledBorder: getInputBorder,
                  border: getInputBorder,
                  hintText: hintText,
                  prefixIcon: Icon(
                    icon,
                    size: size,
                    color: theme.theme == '1' || theme.theme == '7'
                        ? theme.textLight.value
                        : theme.textDark.value,
                  ),
                  hintStyle: TextStyle(
                    color: theme.theme == '1' || theme.theme == '7'
                        ? theme.textLight.value
                        : theme.textDark.value,
                  ),
                ),
              ),
            ],
          );
        });
  }

  OutlineInputBorder get getInputBorder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none);
  }
}
