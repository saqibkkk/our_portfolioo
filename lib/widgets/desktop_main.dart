import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_portfolio/widgets/typing_text.dart';
import '../Controllers/theme_controller.dart';
import '../Controllers/typingtext_controller.dart';
import '../styles/box_decoration.dart';

class DesktopMain extends StatelessWidget {
  const DesktopMain({super.key, required this.onContactBtnTap});
  final VoidCallback onContactBtnTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    final TypingTextController typingController = Get.put(TypingTextController(
      lines: [
        'Want to Develop A Mobile Application or A Website?',
        'Looking for a Business Solution?',
        'We are just a Click Away!',
      ],
    ));

    return GetBuilder<ThemeController>(
        id: '0',
        builder: (themes) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: screenHeight / 1.5,
            constraints: BoxConstraints(minHeight: 350),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TypingTextSwitcher(
                  controller: typingController,
                  textStyle: TextStyle(
                    fontFamily: "NOVA",
                    fontSize: 50,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color:
                    theme.textLight.value
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      foregroundColor: themes.theme == '7'
                          ?themes.textLight.value
                          :themes.textDark.value,
                      backgroundColor: themes.theme == '1'
                          ? themes.yellowPrimary.value
                          : themes.bgLight1.value,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      onContactBtnTap(); // Correctly call the callback
                    },
                    child: Text("Contact Us"),
                  ),
                )
              ],
            ),
          );
        });
  }
}
