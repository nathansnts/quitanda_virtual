import 'package:flutter/material.dart';

class ButtonAddCart extends StatelessWidget {
  final String title;
  final Color colorButton;
  final Color colorText;
  final Color borderColor;

  final VoidCallback onPressedConfirm;

  const ButtonAddCart(
      {super.key,
      required this.title,
      required this.colorButton,
      required this.colorText,
      required this.borderColor,
      required this.onPressedConfirm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          side: BorderSide(color: borderColor, width: 2),
        ),
        onPressed: onPressedConfirm,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: colorText, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
