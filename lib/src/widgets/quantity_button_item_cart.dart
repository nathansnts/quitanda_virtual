import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/item_cart.dart';

import 'package:quitanda_virtual/src/widgets/quantity_button.dart';

import '../config/custom_colors.dart';

class QuantityButtonItemCart extends StatefulWidget {
  final ItemCart itemCart;
  final String unit;
  final VoidCallback onDelete;
  final Function(ItemCart) updatePriceItem;
  const QuantityButtonItemCart({
    Key? key,
    required this.unit,
    required this.onDelete,
    required this.itemCart,
    required this.updatePriceItem,
  }) : super(key: key);

  @override
  State<QuantityButtonItemCart> createState() => _QuantityButtonItemCartState();
}

class _QuantityButtonItemCartState extends State<QuantityButtonItemCart> {
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
            color: widget.itemCart.quantity == 1
                ? Colors.red
                : Colors.grey.shade400,
            icon: widget.itemCart.quantity == 1
                ? Icons.delete_forever_outlined
                : Icons.remove,
            onTap: () {
              setState(() {
                if (widget.itemCart.quantity > 1) {
                  widget.itemCart.quantity--;
                } else {
                  widget.onDelete();
                }
                //Diminui o preço de cada item inserido no carrinho
                widget.updatePriceItem(widget.itemCart);
              });
            },
          ),
          Text(
            '${widget.itemCart.quantity}${widget.unit}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          QuantityButton(
            color: CustomColors.customContrastsColor,
            icon: Icons.add,
            onTap: () {
              setState(() {
                widget.itemCart.quantity++;
                //Aumenta o preço de cada item inserido no carrinho
                widget.updatePriceItem(widget.itemCart);
              });
            },
          ),
        ],
      ),
    );
  }
}
