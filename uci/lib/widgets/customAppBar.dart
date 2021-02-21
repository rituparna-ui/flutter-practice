import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppBarIcons(
            iconData: Icons.settings,
          ),
          Text(
            'Home',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          AppBarIcons(
            iconData: Icons.notifications,
          ),
        ],
      ),
    );
  }
}

class AppBarIcons extends StatelessWidget {
  final IconData iconData;
  const AppBarIcons({
    Key key,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF999999),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        icon: Icon(
          iconData,
          color: Color(0xFF444444),
        ),
        onPressed: () {},
      ),
    );
  }
}
