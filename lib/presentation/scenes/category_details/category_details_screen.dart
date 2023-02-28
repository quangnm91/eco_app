import 'package:flutter/material.dart';

import '../../widgets/product_card.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Clothes'),
        centerTitle: true,
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 16), child: Icon(Icons.search))
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24),
        shrinkWrap: true, // You won't see infinite size error
        itemCount: 5,
        itemBuilder: (BuildContext ctx, index) {
          // TODO: change this
          //  return const ProductCard();
        },
      ),
    );
  }
}
