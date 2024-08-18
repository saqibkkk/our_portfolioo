import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_portfolio/Controllers/theme_controller.dart';
import 'package:http/http.dart' as http;

class ContactController extends GetxController {
  var isSending = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  String? validateEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? validateField(String field, String fieldName) {
    if (field.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  Future<void> sendEmail({
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController subjectController,
    required TextEditingController messageController,
  }) async {
    final nameError = validateField(nameController.text, 'Name');
    final emailError = validateEmail(emailController.text);
    final subjectError = validateField(subjectController.text, 'Subject');
    final messageError = validateField(messageController.text, 'Message');

    if (nameError != null || emailError != null || subjectError != null || messageError != null) {
      showErrorDialog(
        '${nameError ?? ''}\n${emailError ?? ''}\n${subjectError ?? ''}\n${messageError ?? ''}'.trim(),
      );
      return;
    }

    isSending.value = true;
    final serviceId = 'service_78p9r6q';
    final templateId = 'template_vutvybo';
    final userId = 'tZXqX6_zg5fxD7-AG';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': nameController.text,
            'user_email': emailController.text,
            'subject': subjectController.text,
            'user_message': messageController.text,
          },
        }),
      );

      if (response.statusCode == 200) {
        showSuccessDialog('Message sent successfully!');
        clearFields(nameController, emailController, subjectController, messageController);
      } else {
        showErrorDialog('Failed to send message. Please try again later.');
      }
    } finally {
      isSending.value = false;
    }
  }

  void clearFields(
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController subjectController,
      TextEditingController messageController,
      ) {
    nameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }

  void showErrorDialog(String message) {
    Get.dialog(
      GetBuilder<ThemeController>(
          id: '0',
          builder: (theme) {
            return AlertDialog(
              backgroundColor: theme.scaffolBg.value,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded(child: Text(message, style: TextStyle(color: Colors.red))),
                ],
              ),
            );
          }
      ),
      barrierDismissible: true,
    );
  }

  void showSuccessDialog(String message) {
    Get.dialog(
      GetBuilder<ThemeController>(
          id: '0',
          builder: (theme) {
            return AlertDialog(
              backgroundColor: theme.scaffolBg.value,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 10),
                  Expanded(child: Text(message, style: TextStyle(color: Colors.green))),
                ],
              ),
            );
          }
      ),
      barrierDismissible: true,
    );
  }
}
