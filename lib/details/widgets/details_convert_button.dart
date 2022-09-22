import 'package:flutter/material.dart';

class DetailsConvertButton extends StatelessWidget {
  const DetailsConvertButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Center(
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          minWidth: MediaQuery.of(context).size.width - 20,
          height: 45,
          color: Theme.of(context).primaryColor,
          onPressed: () {},
          child: const Text(
            'Converter moeda',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
