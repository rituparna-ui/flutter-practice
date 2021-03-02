import 'package:flutter/material.dart';

import './screens/ifcs.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/ifcs': (context) => Ifsc(),
        '/': (context) => InitialRR(),
      },
      initialRoute: '/',
    );
  }
}

class InitialRR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('IFSC'),
                onTap: () {
                  Navigator.pushNamed(context, '/ifsc');
                },
              )
            ],
          ),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ifsc()),
              );
            },
          ),
        ),
      ),
    );
  }
}
