import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          BottomNavBarIcons(
            color: Colors.blueAccent,
            iconData: Icons.home,
          ),
          BottomNavBarIcons(
            color: Colors.grey,
            iconData: Icons.account_balance_wallet,
          ),
          BottomNavBarIcons(
            color: Colors.grey,
            iconData: Icons.insert_chart,
          ),
          BottomNavBarIcons(
            color: Colors.grey,
            iconData: Icons.person,
          ),
        ],
      ),
    );
  }
}

class BottomNavBarIcons extends StatelessWidget {
  final IconData iconData;
  final Color color;
  const BottomNavBarIcons({
    Key key,
    this.color,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          size: 40,
          color: color,
        ),
      ),
    );
  }
}
