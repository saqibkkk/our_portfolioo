import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../Controllers/contact_controller.dart';
import '../Controllers/theme_controller.dart';
import '../constants/screen_size.dart';
import '../constants/social_media_links.dart';
import 'custom_textfield.dart';
import 'dart:js' as js;

class ContactSection extends StatefulWidget {
  ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {


  @override
  Widget build(BuildContext context) {
    final ContactController contactController = Get.find<ContactController>();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return GetBuilder<ThemeController>(
        id: '0',
        builder: (theme) {
          return Container(
            decoration: BoxDecoration(
                color: theme.theme == '1' || theme.theme == '7'
                    ? theme.textLight.value
                    : theme.bgLight2.value,
                borderRadius: BorderRadius.circular(50)),
            padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
            child: Column(
              children: [
                ConstrainedBox(
                    constraints: screenWidth <= 720
                        ? BoxConstraints(maxWidth: 700, maxHeight: 340)
                        : BoxConstraints(maxWidth: 700, maxHeight: 220),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth >= minDesktopWidth) {
                          return _nameEmailDesktop();
                        }
                        return _nameEmailMobile();
                      },
                    )),
                SizedBox(height: 30),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: CustomTextfield(
                    controller: contactController.messageController,
                    hintText: 'Your Message...',
                    maxLine: 10,
                  ),
                ),
                SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 700),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: contactController.isSending.value
                            ? null
                            : () {
                          contactController.sendEmail(
                            nameController: contactController.nameController,
                            emailController: contactController.emailController,
                            subjectController: contactController.subjectController,
                            messageController: contactController.messageController,
                          );
                              },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: theme.theme == '7'
                              ? theme.textLight.value
                              : theme.textDark.value,
                          backgroundColor: theme.theme == '1'
                              ? theme.yellowPrimary.value
                              : theme.bgLight1.value,
                        ),
                        child: contactController.isSending.value
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    theme.theme == '7'
                                        ? theme.bgLight2.value
                                        : theme.scaffolBg.value),
                              )
                            : Text('Send Message'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Divider(
                      color: theme.theme == '7'
                          ? theme.bgLight2.value
                          : theme.scaffolBg.value,
                    )),
                SizedBox(height: 15),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          js.context
                              .callMethod('open', [SocialMediaLinks.linkedIn]);
                        },
                        child: Image.asset(
                          'assets/contacts/linkedin.png',
                          width: 28,
                        )),
                    InkWell(
                        onTap: () {
                          js.context
                              .callMethod('open', [SocialMediaLinks.facebook]);
                        },
                        child: Image.asset(
                          'assets/contacts/facebook.png',
                          width: 28,
                        )),
                    InkWell(
                        onTap: () {
                          js.context
                              .callMethod('open', [SocialMediaLinks.instagram]);
                        },
                        child: Image.asset(
                          'assets/contacts/instagram.png',
                          width: 28,
                        )),
                    InkWell(
                        onTap: () {
                          js.context
                              .callMethod('open', [SocialMediaLinks.github]);
                        },
                        child: Image.asset(
                          'assets/contacts/github.png',
                          width: 28,
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Row _nameEmailDesktop() {
    final ThemeController theme = Get.put(ThemeController());
    final ContactController contactController = Get.find<ContactController>();
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          height: 200,
          width: 200,
          child: LottieBuilder.asset(
            theme.theme == '0' || theme.theme == '1' || theme.theme == '2'
                ? 'assets/animations/012.json'
                : theme.theme == '4'
                    ? 'assets/animations/4.json'
                    : theme.theme == '3' || theme.theme == '7'
                        ? 'assets/animations/37.json'
                        : theme.theme == '5'
                            ? 'assets/animations/5.json'
                                    : 'assets/animations/012.json',
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 20),
              CustomTextfield(
                controller: contactController.nameController,
                hintText: 'Your Name',
                icon: CupertinoIcons.person,
                size: 22,
              ),
              SizedBox(height: 20),
              CustomTextfield(
                controller: contactController.emailController,
                hintText: 'Your Email',
                icon: CupertinoIcons.mail,
                size: 22,
              ),
              SizedBox(height: 20),
              CustomTextfield(
                controller: contactController.subjectController,
                hintText: 'Subject',
                icon: CupertinoIcons.bubble_right,
                size: 22,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column _nameEmailMobile() {
    final ThemeController theme = Get.put(ThemeController());
    final ContactController contactController = Get.find<ContactController>();
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(bottom: 20),
            height: 150,
            width: 150,
           child: Image.asset(
             theme.theme == '0' || theme.theme == '1' || theme.theme == '2'
                 ? 'assets/gif/012.gif'
                 : theme.theme == '4'
                 ? 'assets/gif/4.gif'
                 : theme.theme == '3' || theme.theme == '7'
                 ? 'assets/gif/37.gif'
                 : theme.theme == '5'
                 ? 'assets/gif/5.gif'
                 : 'assets/gif/012.gif',
           )),

        CustomTextfield(
          controller: contactController.nameController,
          hintText: 'Your Name',
          icon: CupertinoIcons.person,
          size: 18,
        ),
        SizedBox(height: 15),
        CustomTextfield(
          controller: contactController.emailController,
          hintText: 'Your Email',
          icon: CupertinoIcons.mail,
          size: 18,
        ),
        SizedBox(height: 15),
        CustomTextfield(
          controller: contactController.subjectController,
          hintText: 'Subject',
          icon: CupertinoIcons.bubble_right,
          size: 18,
        ),
      ],
    );
  }
}
