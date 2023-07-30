import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1F33);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: const [
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: IconWidget(
                    icon: FontAwesomeIcons.person,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                    colour: activeCardColor,
                  cardChild: IconWidget(
                    icon: FontAwesomeIcons.personDress,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ],
          )),
          const Expanded(
            child: ReusableCard(colour: activeCardColor),
          ),
          Expanded(
              child: Row(
            children: const [
              Expanded(
                child: ReusableCard(colour: activeCardColor),
              ),
              Expanded(
                child: ReusableCard(colour: activeCardColor),
              ),
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

