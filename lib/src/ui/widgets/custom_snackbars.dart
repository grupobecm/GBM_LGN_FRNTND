import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomScanckBar {
  static SnackBar buildSnackBar(String code, String text, ContentType type) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: code,
        message: text,
        contentType: type,
      ),
    );
  }
}
