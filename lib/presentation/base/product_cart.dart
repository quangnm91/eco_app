import 'package:flutter/material.dart';

import 'favorite_icon.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), //add border radius
                child: const Image(
                  image: AssetImage('assets/images/ic_minion.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Snake Leather Bag',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star_half_outlined, size: 18),
                const SizedBox(width: 8),
                const Text('4.5',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
                const SizedBox(width: 8),
                const Text('|', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0))),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      "1,620 sold",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text('\$445',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ],
        ),
        const Positioned(
          top: 8,
          right: 8,
          child: FavoriteIconComponent(),
        ),
      ],
    );
  }
}
