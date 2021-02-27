import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  Map<dynamic, dynamic> dataAPI = {
    'rates': {
      'CAD': 'Loading',
    }
  };

  @override
  void initState() {
    super.initState();
    this.getDataFromApi().then((value) {
      setState(() {
        dataAPI = value;
      });
    });
  }

  Future<Map> getDataFromApi() async {
    http.Response res =
        await http.get('https://api.exchangeratesapi.io/latest');
    return convert.jsonDecode(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Text(
                dataAPI['rates']['CAD'].toString(),
              ),
            );
          }),
    );
  }
}
