import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import '../Controllers/theme_controller.dart';

final ThemeController theme = Get.put(ThemeController());

 BoxDecoration headerDecoration = BoxDecoration(
    color: theme.bgLight2.value.withOpacity(.9),
    borderRadius: BorderRadius.circular(100));
