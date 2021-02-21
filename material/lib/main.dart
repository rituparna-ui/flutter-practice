import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation',
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String ritu = 'Ritu';
  @override
  void initState() {
    super.initState();
    print('init one');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deact first');
  }

  @override
  Widget build(BuildContext context) {
    print('first screen build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Ritu'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Click'),
          color: Colors.teal,
          onPressed: () async {
            ritu = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Second();
                },
              ),
            );
            print(ritu);
          },
        ),
      ),
    );
  }
}

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  void initState() {
    super.initState();
    print('init state second');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deact second');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context, 'Data from screen 2');
          },
          child: Text('ritu'),
        ),
      ),
    );
  }
}
