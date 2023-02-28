import 'package:flutter/material.dart';

import '../../widgets/adjust_quantity_component.dart';
import '../../widgets/carousel_slider_component.dart';
import '../../widgets/favorite_icon.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 28),
        children: [
          CarouselSliderComponent(
              height: MediaQuery.of(context).size.height / 2),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Suga Leather Shoes',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                    FavoriteIconComponent(
                      backgroundColor: Colors.white,
                      size: 28,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(6.0))),
                      child: Text(
                        "1,620 sold",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.star_half_outlined, size: 18),
                    const SizedBox(width: 4),
                    const Text('4.5 (4,794 reviews)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300)),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const Text('Description',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta tempus turpis at sodales. Sed commodo in elit in dignissim. Nulla vel orci mauris. Vestibulum euismod vitae turpis sit amet facilisis. Vestibulum leo lacus, pharetra vel orci ut, interdum lacinia mauris. Morbi ut ullamcorper ex. Sed rhoncus faucibus aliquam. Nam nec dolor in augue semper consequat. Ut blandit, ligula a volutpat congue, diam ipsum ultricies neque, ac ultrices urna nisl ac orci.'),
                const SizedBox(height: 16),
                Row(
                  children: const [
                    Text('Quantity',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    SizedBox(width: 16),
                    AdjustQuantityComponent(),
                  ],
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_bag,
                              color: Colors.white),
                          label: const Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
