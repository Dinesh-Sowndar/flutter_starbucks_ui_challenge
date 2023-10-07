import 'package:flutter/material.dart';
import 'package:starbucks/model/size_model.dart';
import 'package:starbucks/widgets/order_button.dart';
import 'package:starbucks/widgets/product_size.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final List<SizeModel> sizes = [
    SizeModel(name: "Tall", qty: "12 Fl Oz"),
    SizeModel(name: "Grande", qty: "16 Fl Oz"),
    SizeModel(name: "Venti", qty: "24 Fl Oz"),
    SizeModel(name: "Custom", qty: "__ Fl Oz"),
  ];

  int selectedSize = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 25,
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/images/basket.png",
                    width: 28,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                // color: Theme.of(context).primaryColor.withOpacity(0.4),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/products/caramelly_intense.png",
                          // color: Colors.red,
                          width: 180,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: const Text(
                      "Caramel Frappuccino",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$30.00",
                        style: TextStyle(
                            fontSize: 28,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Best Sale",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Size Options",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var i = 0; i < sizes.length; i++)
                      GestureDetector(
                        onTap: () => setState(() {
                          selectedSize = i;
                        }),
                        child: ProductSize(
                            isSelected: selectedSize == i,
                            iconSize: 25 + (i * 5),
                            sizes: sizes[i]),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const OrderButton(),
    );
  }
}
