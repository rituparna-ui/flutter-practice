import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:flutter/material.dart';

const TextStyle digitStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const double bottomContainerHeight = 80;

class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpret;

  ResultPage({this.bmi, this.interpret, this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result.toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpret,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE BMI',
                  style: digitStyle.copyWith(fontSize: 30),
                ),
              ),
              color: Colors.pinkAccent,
              width: double.infinity,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 10),
            ),
          ),
        ],
      ),
    );
  }
}
