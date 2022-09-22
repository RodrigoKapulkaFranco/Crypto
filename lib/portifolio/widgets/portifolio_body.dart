import 'package:flutter/material.dart';

import 'list_view_cripto.dart';
import 'portifolio_header.dart';

class PortifolioBody extends StatelessWidget {
  const PortifolioBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PortifolioHeader(),
        ListViewCripto(),
      ],
    );
  }
}
