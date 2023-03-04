import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:eco_app/presentation/scenes/search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector.dart';
import '../../../routes.dart';
import '../../widgets/product_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final bloc = SearchBloc(productUsecases: injector<ProductUsecases>());
    return BlocConsumer<SearchBloc, SearchState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == SearchStatus.error) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text('ERROR'),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                        child: const Text('Ok'),
                        onPressed: () => Navigator.of(context).pop())
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search_outlined),
                suffixIcon: const Icon(Icons.filter_list_outlined),
                filled: true,
                fillColor: Colors.grey.shade200,
                // focusColor: Colors.grey.shade100,
              ),
              controller: searchController,
              onFieldSubmitted: (value) =>
                  bloc.add(SubmitEvent(keyword: searchController.text)),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: 28, left: 24, right: 24),
            children: [
              // Row(
              //   children: [Text('Results for \"keyword_here\"'), Text('0 found')],
              // ),
              state.status != SearchStatus.initial && state.products.isEmpty
                  ? const Center(child: Text('No product found'))
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24),
                      physics:
                          const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true, // You won't see infinite size error
                      itemCount: state.products.length,
                      itemBuilder: (BuildContext ctx, index) {
                        final product = state.products.elementAt(index);
                        return ProductCard(
                          product: product,
                          onTap: () => Navigator.of(context).pushNamed(
                              Routes.productDetails,
                              arguments: product),
                        );
                      },
                    ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
