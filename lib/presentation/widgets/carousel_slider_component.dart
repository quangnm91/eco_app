import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CarouselSliderComponent extends StatefulWidget {
  const CarouselSliderComponent({required this.height, super.key});
  final double height;

  @override
  State<CarouselSliderComponent> createState() =>
      _CarouselSliderComponentState();
}

class _CarouselSliderComponentState extends State<CarouselSliderComponent> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _index = index;
              });
            },
          ),
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200,
              ),
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            );
          },
        ),
        Positioned(
            child: DotsIndicator(
          dotsCount: 5,
          position: _index.toDouble(),
          decorator: DotsDecorator(
            size: const Size.square(4.0),
            activeSize: const Size(16.0, 4.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ))
      ],
    );
  }
}
