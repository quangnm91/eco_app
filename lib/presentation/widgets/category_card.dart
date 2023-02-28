import 'dart:convert';

import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final LargeCategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Image.memory(const Base64Decoder().convert(
              category.icon.replaceFirst('data:image/png;base64,', ''))),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(category.name,
              overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
