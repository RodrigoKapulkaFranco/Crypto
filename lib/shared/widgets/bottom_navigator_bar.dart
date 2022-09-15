import 'package:flutter/material.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  final int selectedIndex;
  const CustomBottomNavigatorBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacementNamed(
            "/portifolio",
          );
          break;
        case 1:
          Navigator.of(context).pushReplacementNamed(
            "/movements",
          );
          break;
      }
    }

    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: onItemTapped,
      selectedLabelStyle: const TextStyle(
        color: Colors.blue,
      ),
    );
  }
}
