import 'package:flutter/material.dart';

class AdjustQuantityComponent extends StatefulWidget {
  const AdjustQuantityComponent({super.key, this.padding});

  final EdgeInsetsGeometry? padding;
  @override
  State<AdjustQuantityComponent> createState() =>
      _AdjustQuantityComponentState();
}

class _AdjustQuantityComponentState extends State<AdjustQuantityComponent> {
  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          Material(
            color: Colors.grey.shade100,
            child: InkWell(
              borderRadius: BorderRadius.circular(24),
              onTap: () {
                if (_quantity > 0) {
                  setState(() {
                    _quantity--;
                  });
                }
              },
              child: const Icon(Icons.remove),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$_quantity',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
          Material(
            color: Colors.grey.shade100,
            child: InkWell(
              onTap: () {
                setState(() {
                  _quantity++;
                });
              },
              borderRadius: BorderRadius.circular(24),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
