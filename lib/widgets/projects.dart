import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:our_portfolio/widgets/projectcards.dart';
import '../Controllers/theme_controller.dart';
import '../utils/project_utils.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
      return Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(
          children: [
            //   Work Project cards
            SizedBox(height: 20,),
            Text(
              "Our Work Projects",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: theme.theme == '1'
                      ?theme.textLight.value
                      :theme.textDark.value,),
            ),
            SizedBox(
              height: 40,
            ),
            // Project card
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 900
              ),
              child: Wrap(
                spacing: 50,
                runSpacing: 50,
                children: [
                  for(int i = 0; i < workProjectUtils.length; i++)
                    Projectcards(project: workProjectUtils[i]),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Hobby Projects
            Text(
              "Hobby Projects",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: theme.theme == '1'
                      ?theme.textLight.value
                      :theme.textDark.value,),
            ),
            SizedBox(
              height: 50,
            ),
            // Hobby Project card
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: 900
              ),
              child: Wrap(
                spacing: 50,
                runSpacing: 50,
                children: [
                  for(int i = 0; i < hobbyProjectUtils.length; i++)
                    Projectcards(project: hobbyProjectUtils[i]),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
