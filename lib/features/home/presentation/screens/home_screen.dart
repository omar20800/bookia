import 'dart:math';

import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:bookia/features/home/presentation/widgets/home_slider.dart';
import 'package:bookia/features/home/presentation/widgets/popular_books_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        appBar: AppBar(
          forceMaterialTransparency: true,
          actionsPadding: const EdgeInsets.only(right: 12),
          actions: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/notification.svg'),
            ),
            SizedBox(width: 16),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/icons/search-normal.svg'),
            ),
          ],
          title: Image.asset('assets/images/logo.png'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSlider(),
              SizedBox(height: 31),
              Padding(
                padding: const EdgeInsets.only(left: 19, right: 19),
                child: PopularBooksWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
