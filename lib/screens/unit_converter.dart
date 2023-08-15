import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double feetValue = 0;
  double cmValue = 0;

  void convertFeetToCm(double feet) {
    setState(() {
      feetValue = feet;
      cmValue = feet * 30.48;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: ReusableCard(
                onPress: () {},
                colour: kActiveCardColor,
                cardChild: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Enter your Size in Feet',
                        labelStyle: TextStyle(
                          // Set your desired font style properties here
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        fillColor: kInactiveCardColor,
                        filled: true,
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        double feet = double.tryParse(value) ?? 0;
                        convertFeetToCm(feet);
                      },
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Centimeters: $cmValue',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: kGreenTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
