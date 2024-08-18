import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_portfolio/widgets/typing_text.dart';
import '../Controllers/theme_controller.dart';
import '../Controllers/typingtext_controller.dart';
import '../styles/box_decoration.dart';

class MobileMain extends StatelessWidget {
  const MobileMain({super.key, required this.onContactBtnTap});
  final VoidCallback onContactBtnTap;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final TypingTextController controller = Get.put(TypingTextController(
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
          margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          height: screenHeight * 0.5,
          constraints: BoxConstraints(minHeight: 350),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,

                child: TypingTextSwitcher(
                  controller: controller,
                  textStyle: TextStyle(
                      fontFamily: "FontMain",
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                    color: theme.textLight.value
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 130,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                    themes.theme == '7'
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
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
