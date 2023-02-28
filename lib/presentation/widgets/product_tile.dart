import 'package:flutter/material.dart';

import 'adjust_quantity_component.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    this.onRemoveProduct,
    this.showRemoveIcon,
    this.showOnlyQuantity,
  });
  final void Function()? onRemoveProduct;
  final bool? showRemoveIcon;
  final bool? showOnlyQuantity;
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
                child: const Image(
                  image: AssetImage('assets/images/ic_minion.jpeg'),
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
                      const Text('Suga Leather Shoes',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      Visibility(
                        visible: showRemoveIcon ?? true,
                        child: InkWell(
                            onTap: onRemoveProduct,
                            child: const Icon(Icons.delete_outline_outlined)),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Unit type: Kg',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$320.00',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                      (showOnlyQuantity ?? false)
                          ? CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              child: Text('1'),
                            )
                          : AdjustQuantityComponent(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
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
