import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as app_data_mock;
import 'package:quitanda_virtual/src/pages/orders/components/order_tile.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.separated(
          padding: const EdgeInsets.all(16),
          //Animação de rolagem
          physics: const BouncingScrollPhysics(),
          itemBuilder: (_, index) =>
              OrderTile(order: app_data_mock.orders[index]),
          separatorBuilder: (_, index) => const SizedBox(
                height: 10,
              ),
          itemCount: app_data_mock.orders.length),
    );
  }
}
