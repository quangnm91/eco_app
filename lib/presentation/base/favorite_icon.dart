import 'package:flutter/material.dart';

class FavoriteIconComponent extends StatefulWidget {
  const FavoriteIconComponent({super.key});

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
        backgroundColor: Colors.black26,
        radius: 14,
        child: Icon(_isFavorite ? Icons.favorite : Icons.favorite_outline,
            size: 20),
      ),
    );
  }
}
