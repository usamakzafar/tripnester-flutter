import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar color and icon brightness
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF004e4f), // Green
      statusBarIconBrightness: Brightness.light, // White icons
      statusBarBrightness: Brightness.dark, // For iOS
    ),
  );

  runApp(const ProviderScope(child: TripNesterApp()));
}
