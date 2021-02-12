import 'dart:math';

class Brain {
  final int height;
  final int weight;
  double _bmi = 10;

  Brain({this.height, this.weight});

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    // return _bmi.toStringAsFixed(1);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String interpret() {
    if (_bmi >= 25) {
      return 'Eat less and exercise more 🙃';
    } else if (_bmi > 18.5) {
      return 'You are healthy 🥳';
    } else {
      return 'Eat more buddy 🙃';
    }
  }
}
