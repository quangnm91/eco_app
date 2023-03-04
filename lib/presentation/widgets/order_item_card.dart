import 'package:flutter/material.dart';

import '../../domain/model/cart_item_model.dart';

class OrderItemCard extends StatelessWidget {
  final CartItemModel cartItem;
  const OrderItemCard({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: 32, minHeight: 32, maxWidth: 64, maxHeight: 64),
          child: Image.asset(cartItem.product.images!.first.url),
        ),
        title: Text(
          cartItem.product.name,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          maxLines: 2,
        ),
        subtitle: Text(
          "${cartItem.product.price} ₫\nQuantity ${cartItem.quantity}",
        ),
      ),
    );
  }
}
