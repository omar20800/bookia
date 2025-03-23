import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/home/data/model/response/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:bookia/features/home/presentation/screens/book_details_screen.dart';
import 'package:bookia/features/home/presentation/widgets/home_book_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularBooksWidget extends StatefulWidget {
  const PopularBooksWidget({super.key});

  @override
  State<PopularBooksWidget> createState() => _PopularBooksWidgetState();
}

class _PopularBooksWidgetState extends State<PopularBooksWidget> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getBestSeller();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen:
          (_, state) =>
              state is HomeBestSellerSuccess ||
              state is HomeBestSellerError ||
              state is HomeBestSellerLoading,
      builder: (context, state) {
        if (state is HomeBestSellerLoading) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppColours.primaryColor),
              ],
            ),
          );
        }
        List<Product> bestSeller =
            context.read<HomeCubit>().bestSeller?.data?.products ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Popular Books', style: getHeaderTextStyle()),
            SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.5765124555160142,
              ),
              itemCount: bestSeller.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                BookDetails(product: bestSeller[index]),
                      ),
                    );
                  },
                  child: HomeBookTile(product: bestSeller[index]),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
