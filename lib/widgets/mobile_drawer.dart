import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/theme_controller.dart';
import '../constants/nav_items.dart';
import '../styles/box_decoration.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    int selectedIndex = int.parse(theme.theme.value);
    List<Color> selectedColors = themes[selectedIndex];
    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
          return Drawer(
            backgroundColor: theme.scaffolBg.value.withOpacity(.9),
            child: ListView(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          color:
                          theme.theme == '1'
                          ?theme.textLight.value
                          :theme.textDark.value,
                        )),
                  ),
                ),
                for (int i = 0; i < navIcons.length; i++)
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color:
                        theme.theme == '1'
                            ?theme.textLight.value
                            :theme.textDark.value,),
                    onTap: () {
                      onNavItemTap(i);
                    },
                    leading: Icon(
                      navIcons[i],
                      color:  theme.theme == '1'
                          ?theme.textLight.value
                          :theme.textDark.value,
                      size: 16,
                    ),
                    title: Text(navTitles[i]),
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
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
