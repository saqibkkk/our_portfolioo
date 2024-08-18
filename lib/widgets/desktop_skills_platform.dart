import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/skills_animation_controller.dart';
import '../Controllers/theme_controller.dart';
import '../constants/skill_items.dart';

class DesktopSkillsPlatform extends StatelessWidget {
  const DesktopSkillsPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<PageControllerX>();
    final PageControllerX controller = Get.put(PageControllerX(viewportFraction: 0.4));
    controller.startAutoSwipe();

    return GetBuilder<ThemeController>(
      id: '0',
      builder: (theme) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: [
                    for (int i = 0; i < platformItems.length; i++)
                      Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                          color: theme.bgLight2.value,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          leading: Image.asset(platformItems[i]['img'],  filterQuality: FilterQuality.high,),
                          title: Text(
                            platformItems[i]['title'],
                            style: TextStyle(color: theme.textLight.value),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 50),
            // Skills
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600, maxHeight: 220),
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: skillItems.length,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: controller.pageController,
                      builder: (context, child) {
                        double value = 1.0;
                        if (controller.pageController.position.haveDimensions) {
                          value = controller.pageController.page! - index;
                          value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                        }
                        return Center(
                          child: Transform.scale(
                            scale: value,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center, // Ensure horizontal centering
                              children: [
                                // Image with a defined width and height
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Image.asset(
                                    skillItems[index]['img'],
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                SizedBox(height: 20), // Spacing between image and text
                                // Centered text
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Text(
                                    skillItems[index]['title'],
                                    style: TextStyle(
                                      color: theme.theme == '1' || theme.theme == '7'
                                          ? theme.textLight.value
                                          : theme.textDark.value,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center, // Center text horizontally
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )

          ],
        );
      },
    );
  }
}
