import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:starbucks/model/size_model.dart';

class ProductSize extends StatelessWidget {
  const ProductSize(
      {super.key,
      required this.isSelected,
      required this.sizes,
      required this.iconSize});

  final bool isSelected;
  final SizeModel sizes;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context)
                .primaryColor
                .withOpacity(isSelected ? 1 : 0.15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: SvgPicture.asset(
                'assets/svg/cup.svg',
                width: iconSize,
                height: iconSize,
                color: isSelected
                    ? Colors.white
                    : Theme.of(context).primaryColor.withOpacity(0.8),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          sizes.name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Text(
          sizes.qty,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
