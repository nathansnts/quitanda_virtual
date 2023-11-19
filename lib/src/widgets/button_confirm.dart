import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

class ButtonConfirm extends StatelessWidget {
  final String title;
  final Color colorButton;
  final Color colorText;
  final Color borderColor = CustomColors.customContrastsColor;
  final IconData? icon;
  final VoidCallback onPressedConfirm;
  ButtonConfirm({
    super.key,
    required this.title,
    required this.colorButton,
    this.colorText = Colors.white,
    required this.onPressedConfirm,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    //Definindo um botão personalizável com bordas arredondadas

    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
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
            icon != null
                ? Icon(
                    icon,
                    color: colorText,
                  )
                : const Text(''),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
