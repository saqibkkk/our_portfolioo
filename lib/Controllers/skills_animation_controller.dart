import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constants/skill_items.dart';

class PageControllerX extends GetxController {
  late PageController pageController;
  Timer? _timer;
  int _currentPage = 0;

  PageControllerX({double viewportFraction = 0.4}) {
    pageController = PageController(viewportFraction: viewportFraction);
  }

  void startAutoSwipe() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      int nextPage = (_currentPage + 1) % skillItems.length;
      _currentPage = nextPage;

      pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
