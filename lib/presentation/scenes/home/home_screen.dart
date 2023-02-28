import 'package:eco_app/domain/model/large_category_model.dart';
import 'package:eco_app/domain/usecases/category_usecases.dart';
import 'package:eco_app/domain/usecases/product_usecases.dart';
import 'package:eco_app/presentation/scenes/home/home_bloc.dart';
import 'package:eco_app/presentation/scenes/home/home_event.dart';
import 'package:eco_app/presentation/scenes/home/home_state.dart';
import 'package:eco_app/presentation/widgets/category_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../../injector.dart';
import '../../../routes.dart';
import '../../widgets/bottom_navigation_bar_component.dart';
import '../../widgets/carousel_slider_component.dart';
import '../../widgets/category_card.dart';
import '../../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = HomeBloc(
        productUsecases: injector<ProductUsecases>(),
        categoryUsecases: injector<CategoryUsecases>())
      ..add(const InitialEvent());
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: bloc,
      builder: (_, state) {
        if (state.status == HomeStatus.initial) {
          bloc.add(const LoadingEvent());
        }
        if (state.status == HomeStatus.loading) {
          return const LoadingIndicator(
              indicatorType: Indicator.semiCircleSpin,
              colors: const [Colors.white],
              strokeWidth: 2,
              backgroundColor: Colors.white,
              pathBackgroundColor: Colors.white);
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 28, left: 24, right: 24),
            child: ListView(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.blue,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Good morning!'),
                          Text('Quang Nguyen'),
                        ],
                      ),
                    ),
                    const Expanded(
                        flex: 1,
                        child: Icon(Icons.notifications_none_outlined)),
                    const Expanded(
                        flex: 1, child: Icon(Icons.favorite_border_outlined))
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
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
                ),
                const SizedBox(height: 24),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Special Offers',
                //         style: Theme.of(context).textTheme.labelLarge),
                //     Text('See All',
                //         style: Theme.of(context).textTheme.labelLarge)
                //   ],
                // ),
                // const SizedBox(height: 24),
                // const CarouselSliderComponent(height: 200),
                // const SizedBox(height: 24),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 32,
                    childAspectRatio: 0.8,
                  ),
                  physics:
                      const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true, // You won't see infi
                  itemCount: 8,
                  itemBuilder: (BuildContext ctx, index) {
                    LargeCategoryModel category =
                        state.largeCategories.elementAt(index);
                    return CategoryCard(
                      category: category,
                      onTap: () => Navigator.pushNamed(
                          context, Routes.categoryDetails,
                          arguments: category),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Most Popular',
                        style: Theme.of(context).textTheme.labelLarge),
                    Text('See All',
                        style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: state.largeCategories
                          .map((category) =>
                              CategoryChip(categoryName: category.name))
                          .toList()),
                ),
                const SizedBox(height: 24),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24),
                  physics:
                      const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  shrinkWrap: true, // You won't see infinite size error
                  itemCount: state.products.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return ProductCard(
                      product: state.products[index],
                    );
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavigationBarComponent(),
        );
      },
    );
  }
}
