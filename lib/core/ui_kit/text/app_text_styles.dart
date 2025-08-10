import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle? headlineStyle(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge;

  static TextStyle? titleStyle(BuildContext context) =>
      Theme.of(context).textTheme.titleMedium;

  static TextStyle? bodyStyle(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium;
}

// TODO: Add custom text widgets as needed
