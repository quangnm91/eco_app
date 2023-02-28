import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String categoryName;
  const CategoryChip({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black, width: 1.5),
        ),
        child: Text(categoryName,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w500)),
      ),
    );
  }
}
