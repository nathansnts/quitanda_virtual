import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/home/home_page.dart';
import 'package:quitanda_virtual/src/widgets/button_add_cart.dart';
import 'package:quitanda_virtual/src/widgets/quantity_widget.dart';

class ProductsDetails extends StatelessWidget {
  final String price;
  final String nameItem;
  final String img;
  final String description;
  final String unit;

  const ProductsDetails({
    super.key,
    required this.price,
    required this.nameItem,
    required this.img,
    required this.description,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    final sizeVertical = MediaQuery.of(context).size.height * 0.06;
    final sizeHorizontal = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: img,
                  child: Image.asset(
                    img,
                    height: 350,
                    width: 400,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: sizeVertical, horizontal: sizeHorizontal),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              nameItem,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          QuantityWidget(
                            unit: unit,
                            quantity: quantity,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customContrastsColor,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            description,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonAddCart(
                        title: 'Adicionar ao carrinho',
                        colorButton: CustomColors.customContrastsColor,
                        colorText: Colors.white,
                        borderColor: Colors.white,
                        onPressedConfirm: () {
                          print('click....');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 5,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
