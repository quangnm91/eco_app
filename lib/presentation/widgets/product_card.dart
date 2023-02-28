import 'package:eco_app/domain/model/product_model.dart';
import 'package:flutter/material.dart';

import 'favorite_icon.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

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
                child: Image(
                  image: NetworkImage(product.images!.first.url),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              product.name,
              style: Theme.of(context).textTheme.labelLarge,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            // Row(
            //   children: [
            //     const Icon(Icons.star_half_outlined, size: 18),
            //     const SizedBox(width: 8),
            //     const Text('4.5',
            //         style:
            //             TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
            //     const SizedBox(width: 8),
            //     const Text('|', style: TextStyle(fontSize: 14)),
            //     const SizedBox(width: 8),
            //     Container(
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            //       decoration: BoxDecoration(
            //           color: Colors.grey.shade200,
            //           borderRadius:
            //               const BorderRadius.all(Radius.circular(6.0))),
            //       child: const Text(
            //         "1,620 sold",
            //         style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 4),
            Text("${product.price.toString()} đ",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ],
        ),
        // const Positioned(
        //   top: 8,
        //   right: 8,
        //   child: FavoriteIconComponent(),
        // ),
      ],
    );
  }
}
