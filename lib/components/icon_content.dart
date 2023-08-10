import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  const IconWidget({super.key, this.icon, this.label});

  final IconData? icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          // color: const Color(0xFF24D876),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label!,
            style: kLabelTextStyle,
          ),
        ),
      ],
    );
  }
}