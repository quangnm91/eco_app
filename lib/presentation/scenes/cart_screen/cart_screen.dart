import 'package:eco_app/presentation/base/product_tile.dart';
import 'package:flutter/material.dart';

import '../../base/bottom_navigation_bar_component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('My cart'),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 16), child: Icon(Icons.search))
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            children: [
              ProductTile(
                onRemoveProduct: () {
                  showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      builder: (_) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Divider(
                                thickness: 2,
                                indent: 180,
                                endIndent: 180,
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Remove from cart ?',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 16),
                              const Divider(indent: 16, endIndent: 16),
                              const ProductTile(showRemoveIcon: false),
                              const SizedBox(height: 16),
                              const Divider(indent: 16, endIndent: 16),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        backgroundColor: Colors.grey.shade300,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 14),
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(28.0),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        'Yes, Remove',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                ],
                              ),
                              const SizedBox(height: 32),
                            ]);
                      });
                },
              ),
              const ProductTile(),
            ],
          ),
          Positioned(
            // top: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 80,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Total price',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text('\$320.00',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_bag, color: Colors.white),
                      label: const Text(
                        'Checkout',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarComponent(),
    );
  }
}
