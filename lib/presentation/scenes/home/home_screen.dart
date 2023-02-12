import 'package:eco_app/presentation/scenes/home/home_bloc.dart';
import 'package:eco_app/presentation/scenes/home/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../base/bottom_navigation_bar_component.dart';
import '../../base/carousel_slider_component.dart';
import '../../base/product_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = HomeBloc();
    return BlocProvider(
      create: (context) => bloc..add(const InitialEvent()),
      child: Scaffold(
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
                      flex: 1, child: Icon(Icons.notifications_none_outlined)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Special Offers',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text('See All', style: Theme.of(context).textTheme.labelLarge)
                ],
              ),
              const SizedBox(height: 24),
              const CarouselSliderComponent(height: 200),
              const SizedBox(height: 24),
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
                  return _categoryCard(ctx);
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Popular',
                      style: Theme.of(context).textTheme.labelLarge),
                  Text('See All', style: Theme.of(context).textTheme.labelLarge)
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  _categoryChip(context),
                  _categoryChip(context),
                  _categoryChip(context),
                  _categoryChip(context),
                  _categoryChip(context),
                ]),
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
                itemCount: 5,
                itemBuilder: (BuildContext ctx, index) {
                  return const ProductCard();
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarComponent(),
      ),
    );
  }

  // grey scale 50
  // grey scale 700 and 900
  // drop shadow
  _categoryCard(BuildContext ctx) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.outlined_flag_outlined),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text('Clothes'),
          ),
        ],
      ),
    );
  }

  _categoryChip(BuildContext ctx) {
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
        child: Text("Clothes",
            style: Theme.of(ctx)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.w500)),
      ),
    );
  }
}
