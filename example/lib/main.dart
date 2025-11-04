import 'package:flutter/material.dart';
import 'package:luckyui/luckyui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LuckyShowcasePage();
  }
}
