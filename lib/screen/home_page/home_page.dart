import 'package:flutter/material.dart';

import '../movements_page/movements_page.dart';
import '../portfolio_page/portfolio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    PortfolioPage(),
    MovementsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/WARREN-LOGO.png"),
            ),
            label: 'Portifólio',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("images/COIN.png"),
            ),
            label: 'Movimentações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
