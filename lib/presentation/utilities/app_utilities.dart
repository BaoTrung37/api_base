import 'package:flutter/material.dart';

class AppUtilities {
  AppUtilities._();
  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
