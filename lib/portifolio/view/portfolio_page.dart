import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_navigator_bar.dart';
import '../widgets/portifolio_body.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PortifolioBody(),
      bottomNavigationBar: CustomBottomNavigatorBar(
        selectedIndex: 0,
      ),
    );
  }
}
