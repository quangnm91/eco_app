import 'package:flutter/material.dart';

import '../../routes.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  final bottomNavigationIndex = ['home', 'cart', 'orders', 'wallet', 'profile'];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _index = index;
        });
        switch (bottomNavigationIndex[index]) {
          case 'cart':
            Navigator.of(context).pushNamed(Routes.cart);
            break;
        }
      },
      unselectedItemColor: Colors.grey.shade700,
      showUnselectedLabels: true,
      selectedItemColor: Colors.grey.shade700,
      unselectedFontSize: 12,
      currentIndex: _index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout_outlined),
          activeIcon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          activeIcon: Icon(Icons.shopping_bag),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet_travel_outlined),
          activeIcon: Icon(Icons.wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          activeIcon: Icon(Icons.person_2),
          label: 'Profile',
        ),
      ],
    );
  }
}
