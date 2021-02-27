import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    // print(position.latitude);
    // print(position.longitude);
    // print('0');
    return position;
  }

  Future<Map> second() async {
    Position pos = await getLocation();
    Map ritu = {
      'long': pos.longitude,
      'lat': pos.latitude,
    };
    return ritu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
            // print('oku');
            second().then(
              (value) => print(value),
            );
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
