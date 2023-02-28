import 'package:flutter/material.dart';

class FavoriteIconComponent extends StatefulWidget {
  const FavoriteIconComponent(
      {super.key, this.backgroundColor, this.radius, this.size});
  final Color? backgroundColor;
  final double? radius;
  final double? size;

  @override
  State<FavoriteIconComponent> createState() => _FavoriteIconComponentState();
}

class _FavoriteIconComponentState extends State<FavoriteIconComponent> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: CircleAvatar(
        backgroundColor: widget.backgroundColor ?? Colors.black26,
        radius: widget.radius ?? 14,
        child: Icon(_isFavorite ? Icons.favorite : Icons.favorite_outline,
            size: widget.size ?? 20),
      ),
    );
  }
}
