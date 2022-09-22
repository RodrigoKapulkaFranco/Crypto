import 'package:flutter/material.dart';

import '../utils/details_arguments.dart';

class TopImageTitle extends StatelessWidget {
  const TopImageTitle({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final DetailsArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          arguments.cripto.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(
            30,
          ),
          child: Image.network(
            arguments.cripto.imagePath,
            scale: 4,
          ),
        ),
      ],
    );
  }
}
