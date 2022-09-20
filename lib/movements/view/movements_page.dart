import 'package:flutter/material.dart';

import '../../shared/widgets/bottom_navigator_bar.dart';
import '../widgets/movements_body.dart';

class MovementsPage extends StatelessWidget {
  const MovementsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MovementesBody(),
      bottomNavigationBar: CustomBottomNavigatorBar(
        selectedIndex: 1,
      ),
    );
  }
}
