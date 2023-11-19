import 'package:flutter/material.dart';

import 'package:quitanda_virtual/src/config/custom_colors.dart';

class ProgressOrder extends StatelessWidget {
  final String title;
  final IconData? icon;
  const ProgressOrder({Key? key, required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.customContrastsColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: Icon(
                icon,
                size: 20,
                color: CustomColors.customContrastsColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
