import 'item_model.dart';

class ItemCart {
  ItemModel item;
  int quantity;
  ItemCart({
    required this.item,
    required this.quantity,
  });

  double totalPrice() => item.price * quantity;
}
