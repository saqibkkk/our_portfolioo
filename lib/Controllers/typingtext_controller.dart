import 'dart:async';
import 'package:get/get.dart';

class TypingTextController extends GetxController {
  final List<String> lines;
  final Duration letterDuration;
  final Duration lineDelay;

  TypingTextController({
    required this.lines,
    this.letterDuration = const Duration(milliseconds: 100),
    this.lineDelay = const Duration(seconds: 1),
  });

  var displayedText = ''.obs;
  var currentLine = 0.obs;

  late Timer _typingTimer;
  Timer? _lineDelayTimer;

  @override
  void onInit() {
    super.onInit();
    _startTyping();
  }

  void _startTyping() {
    _typingTimer = Timer.periodic(letterDuration, (timer) {
      if (displayedText.value.length < lines[currentLine.value].length) {
        displayedText.value += lines[currentLine.value][displayedText.value.length];
      } else {
        timer.cancel();
        _lineDelayTimer = Timer(lineDelay, () {
          displayedText.value = '';
          currentLine.value = (currentLine.value + 1) % lines.length;
          _startTyping();
        });
      }
    });
  }

  @override
  void onClose() {
    _typingTimer.cancel();
    _lineDelayTimer?.cancel();
    super.onClose();
  }
}
