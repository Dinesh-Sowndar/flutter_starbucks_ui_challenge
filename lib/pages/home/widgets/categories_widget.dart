import 'package:flutter/material.dart';
import 'package:starbucks/model/category_nodel.dart';

// ignore: must_be_immutable
class CategoriesWidget extends StatelessWidget {
  CategoriesWidget({super.key});

  List<CategoryModel> categories = [
    CategoryModel(name: "HOT COFFEE", icon: "assets/images/coffee.png"),
    CategoryModel(name: "DRINKS", icon: "assets/images/drinks.png"),
    CategoryModel(name: "HOT TEAS", icon: "assets/images/tea.png"),
    CategoryModel(name: "BAKERY", icon: "assets/images/bakery.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Stack(
        children: [
          for (var i = 0; i < categories.length; i++)
            Positioned(
              top: categories.length / 2 > i
                  ? 110 - (i * 35)
                  : 110 - ((categories.length - 1 - i) * 35),
              left: (i * MediaQuery.of(context).size.width) / categories.length,
              child: SizedBox(
                width: MediaQuery.of(context).size.width / categories.length,
                height: 90,
                child: Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Image.asset(
                        categories[i].icon,
                        width: 40,
                      )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      categories[i].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
