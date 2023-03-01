import 'dart:convert';

import 'package:eco_app/domain/model/product_model.dart';
import 'package:eco_app/domain/usecases/cart_usecases.dart';
import 'package:eco_app/presentation/scenes/product_details/product_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector.dart';
import '../../widgets/adjust_quantity_component.dart';
import '../../widgets/carousel_slider_component.dart';
import '../../widgets/favorite_icon.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bloc = ProductDetailsBloc(cartUsecases: injector<CartUsecases>());
    return BlocListener<ProductDetailsBloc, ProductDetailsState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == ProductDetailsStatus.error) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('ERROR'),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                );
              });
        }
        if (state.status == ProductDetailsStatus.success) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('Success'),
                  content: const Text('Added to Cart'),
                  actions: [
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                );
              });
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 28),
          children: [
            CarouselSliderComponent(
              height: MediaQuery.of(context).size.height / 2,
              images: product.images,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                      // FavoriteIconComponent(
                      //   backgroundColor: Colors.white,
                      //   size: 28,
                      // )
                    ],
                  ),
                  // const SizedBox(height: 8),
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: 10, vertical: 6),
                  //       decoration: BoxDecoration(
                  //           color: Colors.grey.shade200,
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(6.0))),
                  //       child: Text(
                  //         "1,620 sold",
                  //         style: TextStyle(
                  //             fontSize: 10, fontWeight: FontWeight.w500),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //     const SizedBox(width: 16),
                  //     const Icon(Icons.star_half_outlined, size: 18),
                  //     const SizedBox(width: 4),
                  //     const Text('4.5 (4,794 reviews)',
                  //         style: TextStyle(
                  //             fontSize: 14, fontWeight: FontWeight.w300)),
                  //   ],
                  // ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const Text('Description',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Text(jsonDecode(product.description ?? '')),
                  const SizedBox(height: 16),
                  Text('In stock: ${product.quantity}'),
                  const SizedBox(height: 16),
                  product.quantity > 0
                      ? Row(
                          children: [
                            const Text('Quantity',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            const SizedBox(width: 16),
                            AdjustQuantityComponent(
                                onChanged: (quantity) =>
                                    bloc.rxQuantity.add(quantity)),
                          ],
                        )
                      : const Text(
                          'Out of stock',
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      StreamBuilder(
                        stream: bloc.rxQuantity,
                        initialData: 0,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Total price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12)),
                              const SizedBox(height: 4),
                              Text("${(product.price * snapshot.data)} ₫",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))
                            ],
                          );
                        },
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
                            onPressed: () {
                              bloc.add(AddToCartEvent(
                                  productId: product.id,
                                  quantity: bloc.rxQuantity.values.last));
                            },
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
      ),
    );
  }
}
