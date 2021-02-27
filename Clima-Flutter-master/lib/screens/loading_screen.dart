import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    // Position position = await Geolocator.getCurrentPosition(
    // desiredAccuracy: LocationAccuracy.low);
    // print(position.latitude);
    // print(position.longitude);
    print('0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // getLocation();
            print('oku');
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
