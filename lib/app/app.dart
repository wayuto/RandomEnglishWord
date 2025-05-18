import 'package:flutter/material.dart';
import '../pages/homePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}
