import 'package:flutter/material.dart';
import './../widgets/customAppBar.dart';
import './../widgets/horizontalCardContainer.dart';
import './../widgets/bottomNavBar.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          SizedBox(height: 20),
          HorizontalCardsContainer(),
          Divider(thickness: 5),
          BottomNavBar(),
        ],
      ),
    );
  }
}
