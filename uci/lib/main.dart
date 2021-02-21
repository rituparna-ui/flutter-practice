import 'package:flutter/material.dart';
import './screens/appScreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: AppScreen(),
        ),
      ),
    );
  }
}
