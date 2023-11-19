import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/app_data.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/currency_formatter.dart';

import 'package:quitanda_virtual/src/models/date_time_formatter.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/widgets/button_confirm.dart';
import 'package:quitanda_virtual/src/widgets/progress_order.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      //Widget que expande e diminui o conteúdo
      child: Theme(
        data: ThemeData().copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          textColor: CustomColors.customContrastsColor,
          title: Column(
            //Crescimento no eixo vertical o mínimo possível
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateTimeFormat.formatDateTime(order.createDateTime),
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SizedBox(
              height: 220,
              child: Row(
                children: [
                  Expanded(
                    //proporção de crescimento do expanded
                    flex: 3,
                    child: ListView(
                      children: order.items
                          .map(
                            (i) => Row(
                              children: [
                                Text(
                                  '${i.quantity.toString()} ${i.item.unit}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  i.item.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                //Ocupa o maior espaço possível entre dois widgets
                                const Spacer(),
                                Text(
                                  CurrencyFormatter.formatCurrency(
                                    i.item.price,
                                  ),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 35,
                    color: Colors.grey[800],
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProgressOrder(
                          title: 'Pedido confirmado',
                          icon: Icons.check,
                        ),
                        VerticalDivider(
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey[500],
                        ),
                        const ProgressOrder(title: 'Pagamento'),
                        VerticalDivider(
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey[500],
                        ),
                        const ProgressOrder(title: 'Preparando'),
                        VerticalDivider(
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey[500],
                        ),
                        const ProgressOrder(title: 'Envio'),
                        VerticalDivider(
                          thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          color: Colors.grey[500],
                        ),
                        const ProgressOrder(title: 'Entregue')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  CurrencyFormatter.formatCurrency(order.total),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonConfirm(
              title: 'Ver QR Code Pix',
              colorButton: CustomColors.customContrastsColor,
              icon: Icons.pix_outlined,
              onPressedConfirm: () {},
            ),
          ],
        ),
      ),
    );
  }
}
