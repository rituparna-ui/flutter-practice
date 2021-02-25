import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: StateFulBody(),
      ),
    );
  }
}

class StateFulBody extends StatefulWidget {
  @override
  _StateFulBodyState createState() => _StateFulBodyState();
}

class _StateFulBodyState extends State<StateFulBody> {
  Future<dynamic> _getData() async {
    var data = await http
        .get('http://192.168.43.129:1604/')
        .timeout(const Duration(seconds: 10));

    return convert.jsonDecode(data.body);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot snap) {
        try {
          if (snap.connectionState == ConnectionState.done) {
            return Center(
              child: Container(
                child: Text(snap.data[0]['head']),
              ),
            );
          } else if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        } catch (e) {
          return Center(
            child: Text('Failed to fetch data from the internets'),
          );
        }
      },
    );
  }
}
