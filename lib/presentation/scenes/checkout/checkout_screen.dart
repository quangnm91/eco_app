import 'package:eco_app/domain/usecases/order_usecases.dart';
import 'package:eco_app/presentation/scenes/checkout/checkout_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/cart_model.dart';
import '../../../injector.dart';
import '../../widgets/product_tile.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cart});

  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    var data = [
      {'name': 'Discount 30% Off'},
    ];
    final bloc = CheckoutBloc(orderUsecases: injector<OrderUsecases>());

    return BlocConsumer<CheckoutBloc, CheckoutState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == CheckoutStatus.error) {
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
        if (state.status == CheckoutStatus.success) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.center,
                          children: const [
                            Image(
                              image: AssetImage(
                                  'assets/images/coupon_background.jpg'),
                              fit: BoxFit.cover,
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 96,
                                child: Icon(Icons.shopping_cart, size: 96)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text('Order Successful!',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 16),
                        const Text('You have successfully made order'),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Colors.black,
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                          child: const Text(
                            'View Order',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            backgroundColor: Colors.grey.shade300,
                            minimumSize: const Size.fromHeight(48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                          child: const Text(
                            'View E-Receipt',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back),
            title: const Text('Checkout'),
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ListView(padding: EdgeInsets.only(top: 24), children: [
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: Text(
                    'Shipping address',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 24,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child:
                                Icon(Icons.location_pin, color: Colors.white),
                            radius: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Home', style: TextStyle(fontSize: 18)),
                            SizedBox(height: 4),
                            Text('6140 Sunbrook Park, PC 5667'),
                          ],
                        ),
                      ),
                      Expanded(flex: 1, child: Icon(Icons.edit))
                    ],
                  ),
                ),
                const Divider(indent: 24, endIndent: 24),
                const Padding(
                  padding: EdgeInsets.only(top: 16, left: 24, right: 24),
                  child: Text('Order list',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                ),
                Column(
                  children: cart.cartItems.map((cartItem) {
                    return ProductTile(
                      cartItem: cartItem,
                      showRemoveIcon: false,
                      showOnlyQuantity: true,
                    );
                  }).toList(),
                ),
                // SizedBox(height: 16),
                // const Divider(indent: 24, endIndent: 24),
                // Padding(
                //   padding: const EdgeInsets.only(top: 16, left: 24, right: 16),
                //   child: Text('Choose Shipping',
                //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                // ),
                // Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.all(Radius.circular(16)),
                //       color: Colors.white,
                //     ),
                //     margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                //     padding: EdgeInsets.all(16),
                //     child: Row(
                //       children: [
                //         Expanded(flex: 1, child: Icon(Icons.local_shipping)),
                //         Expanded(
                //             flex: 6,
                //             child: Text(
                //               'Choose Shipping Type',
                //               style: TextStyle(
                //                   fontSize: 18, fontWeight: FontWeight.w500),
                //             )),
                //         Expanded(flex: 1, child: Icon(Icons.navigate_next))
                //       ],
                //     )),
                // _shippingTile(
                //     shippingType: 'Regular',
                //     estimatedArrival: 'Dec 20-22',
                //     price: 15,
                //     shippingIcon: Icon(CupertinoIcons.cube_box_fill)),
                // const Divider(indent: 24, endIndent: 24),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                //   child: Text('Promo Code',
                //       style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 24),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //             border: OutlineInputBorder(
                //                 borderSide: BorderSide.none,
                //                 borderRadius: BorderRadius.circular(12)),
                //             hintText: 'Enter Promo Code',
                //             filled: true,
                //             fillColor: Colors.grey.shade200,
                //           ),
                //         ),
                //       ),
                //       SizedBox(width: 24),
                //       CircleAvatar(
                //         radius: 24,
                //         backgroundColor: Colors.black,
                //         child: Icon(
                //           Icons.add,
                //           color: Colors.white,
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                //   child: Wrap(
                //       alignment: WrapAlignment.start,
                //       spacing: 8.0, // gap between adjacent chips
                //       runSpacing: 8.0, // gap between lines
                //       children: data
                //           .map((e) => Chip(
                //               backgroundColor: Colors.black,
                //               onDeleted: () {},
                //               deleteIcon: Icon(
                //                 Icons.clear,
                //                 color: Colors.white,
                //                 size: 16,
                //               ),
                //               labelPadding: EdgeInsets.all(8),
                //               label: Text(
                //                 '  ${e['name']!}',
                //                 style: TextStyle(color: Colors.white),
                //               )))
                //           .toList()
                //         ..add(Chip(
                //             labelPadding: EdgeInsets.all(8),
                //             backgroundColor: Colors.black,
                //             label: RichText(
                //                 text: WidgetSpan(
                //                     child: Icon(
                //               Icons.add,
                //               color: Colors.white,
                //             )))))),
                // ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Amount'),
                            Text('${cart.total} ₫')
                          ]),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text('Shipping'), Text('-')],
                      ),
                      const SizedBox(height: 16),
                      Divider(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Total'), Text('${cart.total} ₫')],
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                SizedBox(height: 96),
              ]),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                  onPressed: () => bloc.add(
                    ConfirmOrderEvent(
                        userAddressId: 1, shoppingSessionId: cart.id),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _shippingTile(
      {required String shippingType,
      required String estimatedArrival,
      required int price,
      required Icon shippingIcon}) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
                backgroundColor: Colors.black, radius: 24, child: shippingIcon),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shippingType,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text(
                  'Estimated Arrival, ${estimatedArrival}',
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Text(
            '\$$price',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Expanded(flex: 1, child: Icon(Icons.edit))
        ],
      ),
    );
  }
}
