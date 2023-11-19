import 'package:quitanda_virtual/src/models/item_cart.dart';

class OrderModel {
  String id;
  DateTime createDateTime;
  DateTime overdueDateTime;
  List<ItemCart> items;
  String status;
  String copyAndPaste;
  double total;
  OrderModel({
    required this.id,
    required this.createDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.copyAndPaste,
    required this.total,
  });
}
