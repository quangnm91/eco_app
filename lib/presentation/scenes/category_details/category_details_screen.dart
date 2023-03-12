import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../injector.dart';
import '../../widgets/product_card.dart';
import 'category_details_bloc.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final LargeCategoryModel category;
  const CategoryDetailsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final bloc =
        CategoryDetailsBloc(productUsecases: injector<ProductUsecases>());
    return BlocConsumer<CategoryDetailsBloc, CategoryDetailsState>(
      bloc: bloc,
      listenWhen: (previous, current) =>
          current.status == CategoryDetailsStatus.error,
      listener: (context, state) {
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return AlertDialog(
                title: const Text('ERROR'),
                content: Text(state.message),
                actions: [
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
      buildWhen: (previous, current) =>
          current.status != CategoryDetailsStatus.error,
      builder: (context, state) {
        if (state.status == CategoryDetailsStatus.initial) {
          bloc.add(LoadingEvent(largeCategoryId: category.id));
        }
        if (state.status == CategoryDetailsStatus.loading) {
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
            title: Text(category.name),
            centerTitle: true,
            actions: const [
              Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.search))
            ],
          ),
          body: GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24),
            shrinkWrap: true, // You won't see infinite size error
            itemCount: state.products.length,
            itemBuilder: (BuildContext ctx, index) {
              return ProductCard(product: state.products[index]);
            },
          ),
        );
      },
    );
  }
}
