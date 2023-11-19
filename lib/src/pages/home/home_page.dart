import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/currency_formatter.dart';
import 'package:quitanda_virtual/src/pages/home/components/category_tile.dart';
import 'package:quitanda_virtual/src/pages/products/products_detalis.dart';
import 'package:quitanda_virtual/src/widgets/input_login.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as app_data_mock;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        automaticallyImplyLeading: false,
        title: Text(
          'Quintada Virtual',
          style: TextStyle(
            color: CustomColors.customContrastsColor,
          ),
        ),
        centerTitle: true,
        actions: [
          Badge(
            badgeContent: const Text(
              '10',
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topEnd(top: 0, end: -1),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: CustomColors.customContrastsColor,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InputLogin(
                labelInput: 'Pesquise aqui',
                prefexIcon: Icons.search_sharp,
                input: TextInputType.text),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 25,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CategoryTile(
                        category: app_data_mock.categories[index],
                        isSelected:
                            app_data_mock.categories[index] == selectedCategory,
                        onTap: () {
                          setState(() {
                            selectedCategory = app_data_mock.categories[index];
                          });
                        },
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: app_data_mock.categories.length),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15),
              //Remove a curva de animação quando é feito o scroll
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 20,
                childAspectRatio: 9 / 11.5,
              ),
              shrinkWrap: true,
              itemCount: app_data_mock.items.length,

              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductsDetails(
                              price: CurrencyFormatter.formatCurrency(
                                  app_data_mock.items[index].price),
                              img: app_data_mock.items[index].img,
                              nameItem: app_data_mock.items[index].name,
                              description:
                                  app_data_mock.items[index].description,
                              unit: app_data_mock.items[index].unit,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 150,
                              child: Hero(
                                tag: app_data_mock.items[index].img,
                                child: Image.asset(
                                  app_data_mock.items[index].img,
                                  height: 225,
                                  width: 225,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                app_data_mock.items[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '${CurrencyFormatter.formatCurrency(app_data_mock.items[index].price)}/ ${app_data_mock.items[index].unit}',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.customContrastsColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: CustomColors.customContrastsColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(15))),
                          height: 40,
                          width: 35,
                          child: const Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
