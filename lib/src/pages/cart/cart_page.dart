import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/currency_formatter.dart';
import 'package:quitanda_virtual/src/models/item_cart.dart';
import 'package:quitanda_virtual/src/widgets/button_confirm.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as app_data_mock;
import 'package:quitanda_virtual/src/widgets/quantity_button_item_cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //Remover item de dentro do carrinho
  void removeItemFromCart(ItemCart itemCart) {
    setState(() {
      app_data_mock.itemsCart.remove(itemCart);
    });
  }

//Calcula total dos produtos
  double calculateTotal() {
    double total = 0.0;
    for (ItemCart itemCart in app_data_mock.itemsCart) {
      total += itemCart.totalPrice();
    }
    return total;
  }

  void _updatePriceItem(ItemCart itemCart) {
    setState(() {
      for (itemCart in app_data_mock.itemsCart) {
        itemCart.quantity * itemCart.item.price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Carrinho'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              //Container branco de cima aonde fica os produtos adicionados
              child: ListView.builder(
                itemCount: app_data_mock.itemsCart.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            //Imagem dos itens
                            Image.asset(
                              app_data_mock.itemsCart[index].item.img,
                              height: 65,
                              width: 80,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, left: 3),
                                  child: Text(
                                    app_data_mock.itemsCart[index].item.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                //Preço dos produtos
                                Text(
                                  CurrencyFormatter.formatCurrency(
                                    app_data_mock.itemsCart[index].totalPrice(),
                                  ),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColors.customContrastsColor),
                                ),
                              ],
                            ),
                            //Botão de aumentar e colocar a quantidade
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    QuantityButtonItemCart(
                                      updatePriceItem: _updatePriceItem,
                                      itemCart: app_data_mock.itemsCart[index],
                                      unit: app_data_mock
                                          .itemsCart[index].item.unit,
                                      onDelete: () {
                                        setState(() {
                                          removeItemFromCart(
                                              app_data_mock.itemsCart[index]);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          //Container branco de baixo onde fica o botão de confirmar pedido
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 15),
                  child: Row(
                    children: const [
                      Text(
                        'Total geral',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 27, top: 5),
                  child: Row(
                    children: [
                      Text(
                        CurrencyFormatter.formatCurrency(calculateTotal()),
                        style: TextStyle(
                            fontSize: 25,
                            color: CustomColors.customContrastsColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: ButtonConfirm(
                    title: 'Confirmar pedido',
                    colorButton: CustomColors.customContrastsColor,
                    onPressedConfirm: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
