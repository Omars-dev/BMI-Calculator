import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/screens/saved_bmi_data.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/screens/unit_converter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:lottie/lottie.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: kInactiveCardColor,
          child: ListView(
            children: [
              const DrawerHeader(
                curve: Curves.bounceInOut,
                decoration: BoxDecoration(
                  color: kActiveCardColor,
                ),
                child: Center(
                  child: Text(
                    'BMI',
                    style: TextStyle(
                        fontSize: 35,
                        color: kGreenTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.house),
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.weightScale),
                title: const Text(
                  'Unit Converter',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UnitConverter()));
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.cloud),
                title: const Text(
                  'Stored BMI Data',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SavedBmiData()));
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.circleInfo),
                title: const Text(
                  'More Apps',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.message),
                title: const Text(
                  'Need Help',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.star),
                title: const Text(
                  'Rate on Google Play',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  const SnackBar(
                    content: Text('Rate on Google Play'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: Column(
                    children: [
                      Lottie.asset('assets/lottie/animation_llf0x8r8.json'),
                      const Text('MALE',style: kLabelTextStyle),
                    ],
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
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: Column(
                    children: [
                      Lottie.asset('assets/lottie/animation_llezinhc.json'),
                      const Text('FEMALE',style: kLabelTextStyle),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: kLabelTextStyle,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: (){
                          _displayBottomSheet(BuildContext, context);
                        },
                        child: const Icon(
                          FontAwesomeIcons.circleInfo,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kGreenTextColor,
                      overlayColor: const Color(0x2924D876),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      // activeColor: const Color(0xFFEB1555),
                      inactiveColor: const Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {},
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  onPress: () {},
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          const SizedBox(width: 10),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  colour: kActiveCardColor,
                  onPress: () {},
                ),
              ),
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    interpretation: cal.getInterpretation(),
                  ),
                ),
              );
            },
            buttonText: 'Calculate',
          ),
        ],
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext, context){
  return showModalBottomSheet(
      context: context,
      backgroundColor: kGreenTextColor,
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset('assets/icons/height.png'),
              ),
            ),
            const Text('Dont Know Your Height in CM', style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black
            ),),
            const Text('Convert your height Feet 2 CM Just one click',style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnitConverter(),
                  ),
                );
              },
              child: Container(
                width: 220,
                height: 45,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Color(0xFFff8c04),
                      Color(0xFFffbd1e)
                    ]),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: const Center(
                  child: Text(
                    'Convert Height in CM',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
  );
}
