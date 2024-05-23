import 'package:flutter/material.dart';

import 'StationsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red.shade400),
      useMaterial3: true,
      fontFamily: 'Roboto', // Set font family to Roboto
    ),
    home: StationsScreen(),
  );
}