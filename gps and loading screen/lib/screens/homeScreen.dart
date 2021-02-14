import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double oki = 0;
  double oki2 = 0;
  double latitude;
  double longitude;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Material Design'),
        ),
        body: Column(
          children: [
            Text('Latitude $oki'),
            Text('Longitude $oki2'),
            RaisedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    opaque: false,
                    pageBuilder: (_, __, ___) {
                      return Container(
                        child: SpinKitCubeGrid(
                          color: Colors.teal,
                        ),
                      );
                    },
                  ),
                );
                try {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.bestForNavigation);
                  latitude = position.latitude;
                  longitude = position.longitude;
                } catch (e) {}
                Navigator.pop(context);
                setState(() {
                  oki = latitude;
                  oki2 = longitude;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
