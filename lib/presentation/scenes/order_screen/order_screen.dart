import 'package:eco_app/domain/usecases/order_usecases.dart';
import 'package:eco_app/injector.dart';
import 'package:eco_app/presentation/scenes/order_screen/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../core/utils/constants.dart';
import '../../../domain/model/cart_item_model.dart';
import '../../widgets/order_item_card.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = OrderBloc(orderUsecases: injector<OrderUsecases>())
      ..add(const InitialEvent());
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.status == OrderStatus.error) {
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
      },
      bloc: bloc,
      builder: (context, state) {
        if (state.status == OrderStatus.initial) {
          return const LoadingIndicator(
              indicatorType: Indicator.ballScale,
              colors: [Colors.blueAccent],
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white);
        }
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop()),
              title: const Text('My Orders')),
          body: state.orders.isEmpty
              ? const NoOrder()
              : ListView(
                  children: state.orders.map((order) {
                  return ExpansionTile(
                      title: Text('Total: ${order.shoppingSession.total} ₫'),
                      subtitle: Text(
                          'Status: ${Constants.OrderModelStatus[order.status]} \nItems: ${order.shoppingSession.cartItems.length}'),
                      children: order.shoppingSession.cartItems
                          .map((cartItem) => OrderItemCard(cartItem: cartItem))
                          .toList());
                }).toList()),
        );
      },
    );
  }
}

class NoOrder extends StatelessWidget {
  const NoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No history yet",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
