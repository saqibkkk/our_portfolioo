import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'dart:js' as js;
import '../Controllers/theme_controller.dart';
import '../utils/project_utils.dart';

class Projectcards extends StatelessWidget {
  const Projectcards({super.key, required this.project});

  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
      return
      Container(
        clipBehavior: Clip.antiAlias,
        height: 300,
        width: 260,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              project.image,
              height: 140,
              width: 260,
              fit: BoxFit.cover,
            ),
            Container(

              height: 115,
              color: theme.bgLight2.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(12, 15, 12, 12),
                    child: Text(
                      project.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: theme.textLight.value),
                    ),
                  ),
                  //   Subtitle
                  Padding(
                    padding:
                    const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    child: Text(
                      project.subtitle,
                      style: TextStyle(
                          fontSize: 12,
                          color: theme.textLight.value),
                    ),
                  ),
                ],
              ),
            ),
            // Title

            Spacer(),
            //   Card Footer
            Container(
              height: 45,
              color: theme.bgLight1.value,
              padding: EdgeInsets.symmetric(
                  horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Availabe on:',
                    style: TextStyle(
                        color: theme.theme == '1' || theme.theme == '7'
                            ?theme.textLight.value
                            :theme.textDark.value,
                        fontSize: 13),
                  ),
                  Spacer(),
                  if(project.iosLink!=null)
                    InkWell(
                      onTap: (){
                        js.context.callMethod('open',[project.iosLink]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child:
                        Image.asset(
                          'assets/availability/appstore.png', width: 25, ),
                      ),
                    ),
                  if(project.androidLink!=null)
                    InkWell(
                      onTap: (){
                        js.context.callMethod("open",[project.androidLink]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Image.asset(
                          'assets/availability/playstore.png', width: 25,),
                      ),
                    ),
                  if(project.webLink!=null)
                    InkWell(
                      onTap: (){
                        js.context.callMethod('open',[project.webLink]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Image.asset(
                          'assets/availability/www.png', width: 25,),
                      ),
                    ),
                  if(project.driveLink!=null)
                  InkWell(
                    onTap: (){
                      js.context.callMethod('open',[project.driveLink]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child:
                      Image.asset(
                        'assets/availability/drive.png', width: 25,),
                    ),
                  ),
                  if(project.gitLink!=null)
                  InkWell(
                    onTap: (){
                      js.context.callMethod('open',[project.gitLink]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child:
                      Image.asset(
                        'assets/contacts/github.png', width: 25,),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

    });
  }
}
