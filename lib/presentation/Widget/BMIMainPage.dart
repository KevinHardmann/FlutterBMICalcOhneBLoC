import 'dart:ffi';

import 'package:bmi_calc/domain/Brain.dart';
import 'package:flutter/material.dart';

import '../buttons/BottomButton.dart';
import '../buttons/RoundIconButton.dart';
import 'AgeWeightSquer.dart';
import 'ResultPage.dart';

class BMICalcPage extends StatefulWidget {
  const BMICalcPage({Key? key}) : super(key: key);

  @override
  State<BMICalcPage> createState() => _BMICalcPageState();
}

class _BMICalcPageState extends State<BMICalcPage> {
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  double currentSliderValue = 170;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "BMI Rechner",
            style: themeData.textTheme.headline1!.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AgeOrWeight(
                  title: "Alter",
                  lableText: "In Jahren",
                  controller: _ageController,
                  onPressedMinus: () {
                    if (_ageController.text == "") {
                      _ageController.text = "0";
                    } else if (int.parse(_ageController.text) <= 0) {
                      _ageController.text = "0";
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.redAccent,
                          duration: Duration(milliseconds: 1600),
                          content: Text(
                            "Fehler: Alter kann nicht negativ sein",
                            style: themeData.textTheme.bodyText1,
                          )));
                    } else {
                      int age;
                      age = int.parse(_ageController.text);
                      setState(() {
                        age--;
                        _ageController.text = age.toString();
                      });
                    }
                  },
                  onPressedPlus: () {
                    if (_ageController.text == "") {
                      _ageController.text = "1";
                    } else {
                      int age;
                      age = int.parse(_ageController.text);
                      setState(() {
                        age++;
                        _ageController.text = age.toString();
                      });
                    }
                  }),
              const SizedBox(
                width: 10,
              ),
              AgeOrWeight(
                  title: "Gewicht",
                  lableText: "In Kg",
                  controller: _weightController,
                  onPressedMinus: () {
                    if (_weightController.text == "" ||
                        int.parse(_weightController.text) < 1) {
                      _weightController.text = "1";
                    } else {
                      int weight;
                      weight = int.parse(_weightController.text);
                      setState(() {
                        weight--;
                        _weightController.text = weight.toString();
                      });
                    }
                  },
                  onPressedPlus: () {
                    if (_weightController.text == "") {
                      _weightController.text = "1";
                    } else {
                      int weight;
                      weight = int.parse(_weightController.text);
                      setState(() {
                        weight++;
                        _weightController.text = weight.toString();
                      });
                    }
                  }),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 15,
            borderRadius: BorderRadius.circular((15)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((15)),
                color: Colors.blueGrey[800],
              ),
              height: 190,
              width: 190,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Größe",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                          icon: Icons.remove,
                          onPressed: () {
                            if (currentSliderValue >= 61) {
                              setState(() {
                                currentSliderValue--;
                              });
                            } else {
                              setState(() {
                                currentSliderValue = 60;
                              });
                            }
                          }),
                      const SizedBox(
                        width: 50,
                      ),
                      Text(
                        currentSliderValue.toStringAsFixed(0),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      RoundIconButton(
                          icon: Icons.add,
                          onPressed: () {
                            if (currentSliderValue <= 239) {
                              setState(() {
                                currentSliderValue++;
                              });
                            } else {
                              setState(() {
                                currentSliderValue = 240;
                              });
                            }

                          })
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: themeData.colorScheme.secondary,
                      overlayColor: const Color.fromRGBO(
                          61, 126, 126, 0.2196078431372549),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      min: 60,
                      max: 240,
                      value: currentSliderValue,
                      onChanged: (double v) {
                        setState(() {
                          currentSliderValue = v;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: BottomButton(
              btnText: "BMI Berechnen",
              callback: () {
                if (_weightController.text == "" ||
                    _weightController.text == null ||
                    _ageController.text == "" ||
                    _ageController.text == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.redAccent,
                      duration: Duration(milliseconds: 1600),
                      content: Text(
                        "Fehler: Fülle alle Felder aus",
                        style: themeData.textTheme.bodyText1,
                      )));
                } else {
                  CalcBrain calc = CalcBrain(
                      height: currentSliderValue,
                      weight: double.parse(_weightController.text),
                      age: double.parse(_ageController.text));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpration(),
                      ),
                    ),
                  );
                }
              }),
        ),
      ],
    );
  }
}
