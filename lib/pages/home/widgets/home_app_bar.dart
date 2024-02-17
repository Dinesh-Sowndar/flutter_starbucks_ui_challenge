import 'package:flutter/material.dart';
import 'package:starbucks/styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/cup.png",
                width: 32,
              ),
              const SizedBox(
                width: 3,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Qahwa",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: Fonts.gilroy,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Space",
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: Fonts.gilroy,
                        color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            "assets/images/basket.png",
            width: 28,
          )
        ],
      ),
    );
  }
}
