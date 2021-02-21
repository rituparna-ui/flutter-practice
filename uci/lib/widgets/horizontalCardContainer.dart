import 'package:flutter/material.dart';

class HorizontalCardsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            HCard(
              color: Colors.indigo,
            ),
            HCard(
              color: Colors.purple,
            ),
            HCard(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class HCard extends StatelessWidget {
  final Color color;
  const HCard({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        width: 300.0,
      ),
    );
  }
}
