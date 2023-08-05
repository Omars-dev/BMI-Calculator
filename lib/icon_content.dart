import 'package:flutter/material.dart';
import 'constants.dart';

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