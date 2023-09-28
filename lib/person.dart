import 'dart:math';

class Person {
  int height;
  int weight;
  int age;
  double bmi;

  Person(
      {required this.age,
      required this.height,
       required this.weight,
      required this.bmi});

  String calculateBMI() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (bmi > 25.1) {
      return 'Over-weight';
    } else if (bmi > 18.6) {
      return 'Normal';
    } else {
      return 'Under-weight';
    }
  }

  String getInterpretation() {
    if (bmi > 25.1) {
      return 'your bmi is above average try exercising or just eat less, either works well';
    } else if (bmi > 18.6) {
      return 'Healthy living.. Keep it up';
    } else {
      return 'your bmi is below average try getting medical advice or just eat more, either works well';
    }
  }
}
