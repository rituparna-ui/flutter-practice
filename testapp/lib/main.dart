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
      theme: ThemeData(
        primarySwatch: Colors.lime,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: FutureAppBody(),
      ),
    );
  }
}

class FutureAppBody extends StatefulWidget {
  @override
  _FutureAppBodyState createState() => _FutureAppBodyState();
}

class _FutureAppBodyState extends State<FutureAppBody> {
  Future xD;

  _getxD() async {
    return await getData();
    xD = _getxD();
  }

  Future<dynamic> getData() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    try {
      String url = 'http://192.168.56.1:1604';
      http.Response res =
          await http.get(url).timeout(const Duration(seconds: 5));

      return convert.jsonDecode(res.body);
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: xD,
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Text(snapshot.data['ritu']),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        } catch (e) {
          return Center(
            child: Text('Not Connected to internet'),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
