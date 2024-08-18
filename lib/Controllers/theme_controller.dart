import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  var theme = "0".obs;
  var scaffolBg = Color(0xff252734).obs;
  var bgLight1 = Color(0xff333646).obs;
  var bgLight2 = Color(0xff424657).obs;
  var textFieldBg = Color(0xffC8C9CE).obs;
  var hintDark = Color(0xff666874).obs;
  var yellowSecondary = Color(0xffFFC25C).obs;
  var yellowPrimary = Color(0xffFFAF29).obs;
  var whitePrimary = Color(0xffEAEAEB).obs;
  var whiteSecondary = Color(0xffC8C9CE).obs;
  var darkExtra = Color(0xff252734).obs;
  var transparent = Colors.transparent.obs;
  var textDark = Color(0xffF6EBBD).obs;
  var textLight = Color(0xffF6EBBD).obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    await getTheme();
  }

  Future<void> getTheme() async {
    var storedTheme = box.read<String>('storageTheme');
    if (storedTheme == null) {
      theme.value = "0"; // Default theme
      await box.write('storageTheme', theme.value);
    } else {
      theme.value = storedTheme;
    }

    _applyTheme(theme.value);
  }

  void _applyTheme(String themeValue) {
    switch (themeValue) {

        case "0":
        scaffolBg.value = Color(0xffdae2e3);
        bgLight1.value = Color(0xffa2b5b8);
        bgLight2.value = Color(0xff02262b);
        textDark.value = Color(0xff02262b);
        textLight.value = Color(0xffdae2e3);
        break;

      case "1":
        scaffolBg.value = Color(0xff252734);
        bgLight1.value = Color(0xff333646);
        bgLight2.value = Color(0xff424657);
        yellowPrimary.value = Color(0xffFFAF29);
        textDark.value = Color(0xff252734);
        textLight.value = Color(0xffC8C9CE);
        break;

      case "2":
        scaffolBg.value = Color(0xffF6EBBD);
        bgLight1.value = Color(0xff62D6C0);
        bgLight2.value = Color(0xff4DAAE9);
        textDark.value = Color(0xff469CF8);
        textLight.value = Color(0xffF6EBBD);
        break;

      case "3":
        scaffolBg.value = Color(0xfff5d5da);
        bgLight1.value = Color(0xfff0b6c0);
        bgLight2.value = Color(0xfff52011);
        textDark.value = Color(0xfff52011);
        textLight.value = Color(0xfff5d5da);
        break;

      case "4":
        scaffolBg.value = Color(0xffbaf5b8);
        bgLight1.value = Color(0xffdbf7da);
        bgLight2.value = Color(0xff045901);
        textDark.value = Color(0xff045901);
        textLight.value = Color(0xffbaf5b8);
        break;

      case "5":
        scaffolBg.value = Color(0xfff4d0f5);
        bgLight1.value = Color(0xfff4aef5);
        bgLight2.value = Color(0xff68026b);
        textDark.value = Color(0xff68026b);
        textLight.value = Color(0xfff4d0f5);
        break;

      case "6":
        scaffolBg.value = Color(0xffF6EBBD);
        bgLight1.value = Color(0xffD75A4D);
        bgLight2.value = Color(0xff9D3233);
        textDark.value = Color(0xff9D3233);
        textLight.value = Color(0xffF6EBBD);
        break;

    }
    update();
  }

  void setTheme(String newTheme) async {
    print('Setting theme to: $newTheme');
    theme.value = newTheme;
    await box.write('storageTheme', theme.value);
    _applyTheme(newTheme);
  }
}
