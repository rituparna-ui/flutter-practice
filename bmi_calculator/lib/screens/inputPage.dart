import './../brain.dart';
import './../screens/resultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/iconContent.dart';
import '../widgets/reusableCard.dart';

const double bottomContainerHeight = 80;
const Color cardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const TextStyle digitStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);
const TextStyle txtStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFFFF8DAE98),
);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      color: selectedGender == Gender.male
                          ? cardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.male,
                        content: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: selectedGender == Gender.female
                          ? cardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.female,
                        content: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                color: cardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFFF8DAE98),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          height.toString(),
                          style: digitStyle,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFFFF8DAE98),
                          ),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.grey,
                        inactiveTrackColor: Colors.teal,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x28EB1555),
                        // overlayColor: Color(0x29AABBCC),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newVal) {
                          setState(() {
                            height = newVal.toInt();
                            // print(newVal);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: txtStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: digitStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                child: Icons.multiline_chart,
                                press: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                child: Icons.add,
                                press: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: cardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: txtStyle,
                          ),
                          Text(
                            age.toString(),
                            style: digitStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(
                                child: Icons.multiline_chart,
                                press: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              RoundIconButton(
                                child: Icons.add,
                                press: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Brain calc = Brain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calc.calculate(),
                      interpret: calc.interpret(),
                      result: calc.result(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final Function press;

  RoundIconButton({@required this.child, @required this.press});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(child),
      onPressed: press,
      elevation: 6,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 50,
        width: 50,
      ),
    );
  }
}
