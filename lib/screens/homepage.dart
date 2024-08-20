import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/theme_controller.dart';
import '../constants/screen_size.dart';
import '../widgets/contact_section.dart';
import '../widgets/desktop_header.dart';
import '../widgets/desktop_skills_platform.dart';
import '../widgets/footer.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/mobile_header.dart';
import '../widgets/desktop_main.dart';
import '../widgets/mobile_main.dart';
import 'dart:html' as html;
import '../widgets/mobile_skills_platform.dart';
import '../widgets/projects.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController scrollController = ScrollController();
  final List<GlobalKey> navBarKeys = List.generate(4, (index) => GlobalKey());

  @override
  void initState() {
    Image.asset(
      'assets/background_video/background.gif',
      fit: BoxFit.cover,
    );
    super.initState();
  }

  Future<void> _refreshPage() async {
    html.window.location.assign(html.window.location.href);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;


    return GetBuilder<ThemeController>(
      id: '0',
      builder: (theme) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              key: scaffoldKey,
              backgroundColor: theme.scaffolBg.value,
              endDrawer: constraints.maxWidth >= medMoreDesktopWidth
                  ? null
                  : MobileDrawer(onNavItemTap: (int navIndex) {
                      scaffoldKey.currentState?.closeEndDrawer();
                      scrollToSection(navIndex);
                    }),
              body: Stack(
                children: [
                  RefreshIndicator(
                    color: theme.bgLight2.value,
                    backgroundColor: theme.scaffolBg.value,
                    onRefresh: _refreshPage,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(
                            key: navBarKeys.first,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: screenWidth,
                                height: screenHeight / 1.5,
                                child: Image.asset(
                                  'assets/background_video/background.gif',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: constraints.maxWidth >= medDesktopWidth
                                    ? DesktopMain(
                                        onContactBtnTap: () {
                                          scrollToSection(3);
                                        },
                                      )
                                    : MobileMain(
                                        onContactBtnTap: () {
                                          scrollToSection(3);
                                        },
                                      ),
                              ),
                            ],
                          ),
                          Container(
                            key: navBarKeys[1],
                            padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                            width: screenWidth,
                            color: theme.bgLight1.value,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Our Services:",
                                  style: TextStyle(
                                    fontFamily: "NOVA",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: theme.theme == '1'
                                        ? theme.textLight.value
                                        : theme.textDark.value,
                                  ),
                                ),
                                SizedBox(height: 50),
                                if (constraints.maxWidth >= medMoreDesktopWidth)
                                  DesktopSkillsPlatform()
                                else
                                  MobileSkillsPlatform(),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Projects(
                            key: navBarKeys[2],
                          ),
                          SizedBox(height: 30),
                          Container(
                            padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                            width: screenWidth,
                            color: theme.bgLight1.value,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Get In Touch",
                                  style: TextStyle(
                                    fontFamily: "NOVA",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: theme.theme == '1'
                                        ? theme.textLight.value
                                        : theme.textDark.value,
                                  ),
                                ),
                                SizedBox(height: 50),
                                ContactSection(
                                  key: navBarKeys[3],
                                ),
                              ],
                            ),
                          ),
                          Footer(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: constraints.maxWidth >= medMoreDesktopWidth
                        ? DesktopHeader(onNavBarTap: (int navIndex) {
                            scrollToSection(navIndex);
                          })
                        : MobileHeader(
                            onMenuTap: () {
                              scaffoldKey.currentState?.openEndDrawer();
                            },
                            onLogoTap: () {},
                          ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void scrollToSection(int navIndex) {
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(key.currentContext!,
        duration: Duration(milliseconds: 800), curve: Curves.easeInOut);
  }
}
