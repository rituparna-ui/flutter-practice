import 'package:flutter/material.dart';
import 'screens/inputPage.dart';
import 'screens/resultPage.dart';

const int x = 2;

void main() {
  runApp(BmiApp());
}

class BmiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage()
      },
    );
  }
}
