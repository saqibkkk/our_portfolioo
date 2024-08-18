import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/skills_animation_controller.dart';
import '../Controllers/theme_controller.dart';
import '../constants/skill_items.dart';

class MobileSkillsPlatform extends StatelessWidget {
  const MobileSkillsPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    Get.delete<PageControllerX>();
    final PageControllerX controller = Get.put(PageControllerX(viewportFraction: 0.4));
    controller.startAutoSwipe();

    return GetBuilder<ThemeController>(
      id: '0',
      builder: (theme) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            children: [
              // Platform items
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: theme.bgLight2.value,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    leading: Image.asset(platformItems[i]['img'], width: 26),
                    title: Text(
                      platformItems[i]['title'],
                      style: TextStyle(color: theme.textLight.value),
                    ),
                  ),
                ),
              SizedBox(height: 50),
              // Skills
              Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 500, maxHeight: 150),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Image.asset(
                                      skillItems[index]['img'],
                                      width: 70,
                                      height: 70,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                          child: Text(
                                      skillItems[index]['title'],
                                      style: TextStyle(
                                        color: theme.theme == '1' || theme.theme == '7'
                                            ?theme.textLight.value
                                            :theme.textDark.value,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                            textAlign: TextAlign.center,
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
              ),
            ],
          ),
        );
      },
    );
  }
}
