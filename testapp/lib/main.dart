import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import './global/envt.dart';

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
        body: AppBody(),
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

  void initState() {
    super.initState();
    xD = _getxD();
  }

  _getxD() async {
    return await getData();
  }

  Future<dynamic> getData() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    try {
      http.Response res =
          await http.get(Envt.url).timeout(const Duration(seconds: 5));

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

class AppBody extends StatelessWidget {
  void _sendReq() async {
    print('poki');
    try {
      await http.post(
        Envt.url,
        body: {'message': 'hello from flutter', 'status': 'JsonEncoded'},
        headers: {'auth': 'xD'},
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: _sendReq,
        child: Text('click'),
      ),
    );
  }
}
