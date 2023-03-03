import 'package:eco_app/domain/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class CarouselSliderComponent extends StatefulWidget {
  const CarouselSliderComponent({required this.height, super.key, this.images});

  final double height;
  final List<ImageModel>? images;

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
          itemCount: widget.images?.length ?? 1,
          itemBuilder: (context, index, realIndex) {
            if (widget.images == null) {
              return Image.asset('assets/gifs/ic_loading.gif');
            }

            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: Colors.grey.shade200,
                ),
                child: Image(
                  image: NetworkImage(widget.images!.elementAt(index).url),
                ));
          },
        ),
        Positioned(
            child: DotsIndicator(
          dotsCount: widget.images?.length ?? 1,
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
