import 'package:flutter/material.dart';

typedef onChangedCallback = void Function(int);

class AdjustQuantityComponent extends StatefulWidget {
  AdjustQuantityComponent(
      {super.key,
      this.padding,
      this.onChanged,
      this.quantity = 0,
      this.max = 1000});

  final EdgeInsetsGeometry? padding;
  final onChangedCallback? onChanged;
  int quantity;
  int max;
  @override
  State<AdjustQuantityComponent> createState() =>
      _AdjustQuantityComponentState();
}

class _AdjustQuantityComponentState extends State<AdjustQuantityComponent> {
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
                if (widget.quantity > 0) {
                  setState(() {
                    --widget.quantity;
                    if (widget.onChanged != null) {
                      widget.onChanged!(widget.quantity);
                    }
                  });
                }
              },
              child: const Icon(Icons.remove),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${widget.quantity}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 12),
          Material(
            color: Colors.grey.shade100,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (widget.quantity < widget.max) {
                    ++widget.quantity;
                    widget.onChanged != null
                        ? widget.onChanged!(widget.quantity)
                        : null;
                  }
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
