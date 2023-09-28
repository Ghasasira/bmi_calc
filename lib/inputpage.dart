import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusables.dart';
import 'person.dart';
import 'results.dart';

const containerHeight = 80.0;
const reusableColor = Color(0xFF1D1E33);
const activeColor = Color(0xAB0FECDA);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Person person1 = Person(age: 18, height: 120, weight: 60, bmi: 0);

  Color maleact = reusableColor;
  Color femaleact = reusableColor;
  List<String> genderList = ['male', 'female'];
  String? gender;
  void updateGender() {
    if (gender == 'male') {
      maleact == activeColor ? maleact = reusableColor : maleact = activeColor;
      femaleact = reusableColor;
    } else {
      femaleact == activeColor
          ? femaleact = reusableColor
          : femaleact = activeColor;
      maleact = reusableColor;
    }
    debugPrint(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    colour: maleact,
                    onPress: () {
                      setState(() {
                        gender = genderList[0];
                        updateGender();
                      });
                    },
                    containerChild: Gendercard(
                        symbol: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: femaleact,
                    onPress: () {
                      setState(() {
                        gender = genderList[1];
                        updateGender();
                      });
                    },
                    containerChild: Gendercard(
                        symbol: FontAwesomeIcons.venus, gender: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableContainer(
              colour: reusableColor,
              containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        person1.height.toString(),
                        style: const TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        ' cm',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: person1.height.toDouble(),
                      onChanged: (double newValue) {
                        setState(() {
                          person1.height = newValue.toInt();
                        });
                      },
                      activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8B8E98),
                      min: 100.0,
                      max: 250.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableContainer(
                    colour: reusableColor,
                    containerChild: SizeCard(
                      size: person1.weight.toString(),
                      label: 'WEIGHT',
                      add: () {
                        setState(() {
                          person1.weight++;
                        });
                      },
                      sub: () {
                        setState(() {
                          person1.weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableContainer(
                    colour: reusableColor,
                    containerChild: SizeCard(
                      size: person1.age.toString(),
                      label: 'AGE',
                      add: () {
                        setState(() {
                          person1.age++;
                        });
                      },
                      sub: () {
                        setState(() {
                          person1.age--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                    result: person1.calculateBMI(),
                    textresult: person1.getResult(),
                    interpretation: person1.getInterpretation(),
                  );
                }),
              );
              debugPrint(person1.bmi.toString());
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFEB1555),
                  borderRadius: BorderRadius.circular(8.0)),
              margin: const EdgeInsets.only(top: 5.0),
              width: double.infinity,
              height: containerHeight,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
