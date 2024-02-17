import 'package:flutter/material.dart';
import 'package:starbucks/model/product_model.dart';
import 'package:starbucks/model/size_model.dart';
import 'package:starbucks/pages/details/widgets/details_app_bar.dart';
import 'package:starbucks/pages/details/widgets/order_button.dart';
import 'package:starbucks/pages/details/widgets/product_size.dart';
import 'package:starbucks/widgets/fade_in_down.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

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
              const DetailsAppBar(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      top: 0,
                      child: Hero(
                        tag: widget.product.name,
                        child: Image.asset(
                          widget.product.image,
                          height: 400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 500),
                from: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        widget.product.name,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${widget.product.price.toStringAsFixed(2)}",
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
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 400),
                duration: const Duration(milliseconds: 500),
                from: 50,
                child: const Text(
                  "Size Options",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              FadeInDown(
                delay: const Duration(milliseconds: 600),
                duration: const Duration(milliseconds: 500),
                from: 50,
                child: Padding(
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
