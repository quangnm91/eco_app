import 'package:eco_app/domain/usecases/cart_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../injector.dart';
import '../../../routes.dart';
import '../../widgets/bottom_navigation_bar_component.dart';
import '../../widgets/product_tile.dart';
import 'cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = CartBloc(cartUsecases: injector<CartUsecases>());
    return BlocConsumer<CartBloc, CartState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == CartStatus.error) {
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
        // if (state.status == CartStatus.success) {
        //   showDialog(
        //       context: context,
        //       builder: (BuildContext ctx) {
        //         return AlertDialog(
        //           title: const Text('SUCCESS'),
        //           content: Text(state.message),
        //           actions: [
        //             TextButton(
        //                 child: const Text('Ok'),
        //                 onPressed: () => Navigator.of(context).pop())
        //           ],
        //         );
        //       });
        // }
      },
      builder: (context, state) {
        if (state.status == CartStatus.initial) {
          bloc.add(const LoadingEvent());
        }
        if (state.status == CartStatus.loading) {
          return const LoadingIndicator(
              indicatorType: Indicator.ballScale,
              colors: [Colors.blueAccent],
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white);
        }
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: const Text('My cart'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.search))
            ],
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                children: state.cart == null
                    ? []
                    : state.cart!.cartItems.map(
                        (cartItem) {
                          return ProductTile(
                            cartItem: cartItem,
                            onChangeQuantity: (quantity) => bloc.add(
                              ChangeCartItemQuantity(
                                cartItemId: cartItem.id,
                                quantity: quantity,
                              ),
                            ),
                            onRemoveProduct: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16))),
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
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(height: 16),
                                          const Divider(
                                              indent: 16, endIndent: 16),
                                          ProductTile(
                                              cartItem: cartItem,
                                              showRemoveIcon: false,
                                              showOnlyQuantity: true),
                                          const SizedBox(height: 16),
                                          const Divider(
                                              indent: 16, endIndent: 16),
                                          const SizedBox(height: 16),
                                          Row(
                                            children: [
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 14),
                                                    backgroundColor:
                                                        Colors.grey.shade300,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28.0),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: TextButton(
                                                  style: TextButton.styleFrom(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 14),
                                                    backgroundColor:
                                                        Colors.black,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              28.0),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    bloc.add(RemoveFromCart(
                                                        cartItemId:
                                                            cartItem.id));
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    'Yes, Remove',
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                          );
                        },
                      ).toList(),
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
                          children: [
                            const Text(
                              'Total price',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text("${state.cart?.total ?? 0} ₫",
                                style: const TextStyle(
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
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.checkout,
                                arguments: state.cart);
                          },
                          icon: const Icon(Icons.shopping_bag,
                              color: Colors.white),
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
          // bottomNavigationBar: const BottomNavigationBarComponent(),
        );
      },
    );
  }
}
