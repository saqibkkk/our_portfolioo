import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:our_portfolio/widgets/site_logo.dart';
import '../Controllers/theme_controller.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ThemeController>(
      id: '0',
      builder: (theme) {
        return Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 50,
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 5), // Adjust this if necessary
          decoration: BoxDecoration(
              color: theme.bgLight2.value.withOpacity(.9),
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SiteLogo(
                  onTap: () {
                    if (onLogoTap != null) {
                      onLogoTap!();  // Call the onLogoTap callback
                    }
                    print('Logo button is pressed');
                  },
                ),
              ),
              Text(
                'PORTFOLIO',
                style: TextStyle(
                    fontFamily: "FontTitle",
                    color: theme.scaffolBg.value,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
              const Spacer(),

              IconButton(
                  onPressed: () {
                    if (onMenuTap != null) {
                      onMenuTap!();
                    }
                    print('Menu button is pressed');
                  },
                  icon: Icon(Icons.menu, color: theme.scaffolBg.value,)),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        );
      }
    );
  }
}

