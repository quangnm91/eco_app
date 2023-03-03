// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/model/cart_item_model.dart';
import '../../domain/model/product_model.dart';
import 'adjust_quantity_component.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.cartItem,
    this.onRemoveProduct,
    this.showRemoveIcon,
    this.showOnlyQuantity = false,
    this.onChangeQuantity,
  });

  final CartItemModel cartItem;
  final void Function()? onRemoveProduct;
  final void Function(int)? onChangeQuantity;
  final bool? showRemoveIcon;
  final bool showOnlyQuantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.white),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0), //add border radius
                child: Image(
                  image: NetworkImage(cartItem.product.images!.first.url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(cartItem.product.name,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                      ),
                      Expanded(
                        child: Visibility(
                          visible: showRemoveIcon ?? true,
                          child: InkWell(
                              onTap: onRemoveProduct,
                              child: const Icon(Icons.delete_outline_outlined)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Unit Type: ${cartItem.product.unitType}',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${cartItem.quantity * cartItem.product.price} ₫',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      (showOnlyQuantity)
                          ? CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              child: Text(
                                cartItem.quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            )
                          : AdjustQuantityComponent(
                              quantity: cartItem.quantity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              onChanged: onChangeQuantity,
                            )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
