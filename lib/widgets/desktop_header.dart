import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:our_portfolio/widgets/site_logo.dart';
import '../Controllers/theme_controller.dart';
import '../constants/nav_items.dart';
import '../styles/box_decoration.dart';

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key, required this.onNavBarTap});
  final Function(int) onNavBarTap;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = int.parse(theme.theme.value);
    List<Color> selectedColors = themes[selectedIndex];
    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {

          return Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: theme.bgLight2.value.withOpacity(.9),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SiteLogo(
                    onTap: () {},
                  ),
                ),
                Spacer(),
                for (int i = 0; i < navTitles.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {
                        onNavBarTap(i);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: navTitles[i] == 'Contacts'
                            ? theme.scaffolBg.value
                            : Colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                      child: Text(
                        navTitles[i],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color:
                          theme.theme == '1'
                          ?theme.textLight.value
                              :navTitles[i] == 'Contacts'
                              ? theme.textDark.value
                              : theme.textLight.value,
                        ),
                      ),
                    ),
                  ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: theme.bgLight2.value,
                  ),
                  child: DropdownButton<List<Color>>(
                    icon: Icon(Icons.arrow_drop_down, color: theme.textLight.value),
                    items: themes.map((colorList) {
                      return DropdownMenuItem<List<Color>>(
                        value: colorList,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: colorList
                              .map((color) => ColorBox(color: color))
                              .toList(),
                        ),
                      );
                    }).toList(),
                    onChanged: (List<Color>? selectedColors) {
                      if (selectedColors != null) {
                        int index = themes.indexOf(selectedColors);
                        theme.setTheme(index.toString()); // Map to the selected theme index
                      }
                    },
                    hint: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: selectedColors
                          .map((color) => ColorBox(color: color))
                          .toList(),
                    ),
                    dropdownColor: theme.bgLight2.value,
                    underline: SizedBox(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
class ColorBox extends StatelessWidget {
  final Color color;

  const ColorBox({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20, // Adjust size as needed
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white, // Border color
          width: 1, // Border width
        ),
      ),
    );
  }
}


