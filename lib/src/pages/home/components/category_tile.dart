import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {super.key,
      required this.category,
      required this.isSelected,
      required this.onTap});

  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          decoration: BoxDecoration(
              color: isSelected
                  ? CustomColors.customContrastsColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            category,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.red,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
