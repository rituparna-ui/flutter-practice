import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String content;
  IconContent({@required this.icon, @required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          content,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFFF8DAE98),
          ),
        ),
      ],
    );
  }
}
