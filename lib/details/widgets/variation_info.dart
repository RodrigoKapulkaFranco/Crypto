import 'package:flutter/material.dart';

class Variationinfo extends StatelessWidget {
  final double variation;
  const Variationinfo({
    Key? key,
    required this.variation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (variation == 1) {
      return const Text(
        '0.00%',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (variation > 1) {
      return Text(
        '+${((variation - 1) * 100).toStringAsFixed(2)}%',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      );
    } else {
      return Text(
        '${((variation - 1) * 100).toStringAsFixed(2)}%',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      );
    }
  }
}
