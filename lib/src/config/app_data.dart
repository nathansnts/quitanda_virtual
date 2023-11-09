import 'package:quitanda_virtual/src/models/item_cart.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';

//Mock: são dados fixos da aplicação
ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  img: 'assets/images/apple.png',
  name: 'Maçã',
  price: 5.5,
  unit: 'Kg',
);

ItemModel grape = ItemModel(
  img: 'assets/images/grape.png',
  name: 'Uva',
  price: 7.4,
  unit: 'Kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  img: 'assets/images/guava.png',
  name: 'Goiaba',
  price: 11.5,
  unit: 'Kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  img: 'assets/images/kiwi.png',
  name: 'Kiwi',
  price: 2.5,
  unit: 'Un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  img: 'assets/images/mango.png',
  name: 'Manga',
  price: 2.5,
  unit: 'Un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  img: 'assets/images/papaya.png',
  name: 'Mamão papaya',
  price: 8,
  unit: 'Kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

//Lista de categorias
List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais'
];

List<ItemCart> itemsCart = [
  ItemCart(item: apple, quantity: 3),
  ItemCart(item: mango, quantity: 3),
  ItemCart(item: grape, quantity: 3),
];
