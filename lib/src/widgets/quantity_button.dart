import 'package:flutter/material.dart';

class QuantityButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onTap;
  const QuantityButton(
      {super.key,
      required this.color,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 45,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
