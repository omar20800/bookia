import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/features/home/data/model/response/slider_response/slider.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getSlider();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen:
          (_, state) =>
              state is HomeSliderSuccess ||
              state is HomeSliderError ||
              state is HomeSliderLoading,
      builder: (context, state) {
        if (state is HomeSliderLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColours.primaryColor),
              ],
            ),
          );
        }
        List<SliderImage> slider =
            context.read<HomeCubit>().slider?.data?.sliders ?? [];
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: slider.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: slider[itemIndex].image ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
              options: CarouselOptions(
                height: 150,
                viewportFraction: 0.9,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: PageController(initialPage: currentIndex),
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                dotHeight: 7,
                dotWidth: 7,
                expansionFactor: 4,
                spacing: 5,
                activeDotColor: AppColours.primaryColor,
              ),
              onDotClicked: (index) {},
            ),
          ],
        );
      },
    );
  }
}
