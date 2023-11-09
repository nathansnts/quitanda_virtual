import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/widgets/quantity_button.dart';

class QuantityWidget extends StatefulWidget {
  int quantity;
  final String unit;
  QuantityWidget({
    Key? key,
    this.quantity = 1,
    required this.unit,
  }) : super(key: key);

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400, spreadRadius: 1, blurRadius: 2),
        ],
      ),
      child: Row(
        children: [
          QuantityButton(
            color: Colors.grey.shade400,
            icon: Icons.remove,
            onTap: () {
              setState(() {
                if (widget.quantity > 1) {
                  widget.quantity--;
                }
              });
            },
          ),
          Text(
            '${widget.quantity}${widget.unit}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          QuantityButton(
            color: CustomColors.customContrastsColor,
            icon: Icons.add,
            onTap: () {
              setState(() {
                widget.quantity++;
              });
            },
          ),
        ],
      ),
    );
  }
}
