import 'package:flutter/material.dart';

import './appBody.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Currency'),
          centerTitle: true,
        ),
        body: AppBody(),
      ),
    );
  }
}
