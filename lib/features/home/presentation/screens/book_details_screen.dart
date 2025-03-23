import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/features/home/data/model/request/home_request.dart';
import 'package:bookia/features/home/data/model/response/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if (state is AddtoWishListError) {
            showErrorToast(context, 'Something went wrong');
          } else if (state is AddtoWishListSuccess) {
            showSuccessToast(context, 'Added to wishlist');
          }
          if (state is AddtoCartError) {
            showErrorToast(context, 'Something went wrong');
          } else if (state is AddtoCartSuccess) {
            showSuccessToast(context, 'Added to cart');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Book Details', style: getHeaderTextStyle()),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<HomeCubit>().addtoWishList(
                      HomeRequest(id: product.id),
                    );
                  },
                  icon: SvgPicture.asset('assets/icons/Bookmark.svg'),
                ),
              ],
              actionsPadding: const EdgeInsets.only(right: 20),
            ),
            body: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Hero(
                              tag: product.id.toString(),
                              child: SizedBox(
                                height: 271,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(7),
                                  child: CachedNetworkImage(
                                    imageUrl: product.image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              product.name ?? '',
                              textAlign: TextAlign.center,
                              style: getHeaderTextStyle(fontSize: 30),
                            ),
                            SizedBox(height: 5),
                            Text(
                              product.category ?? '',
                              style: getBodyTextStyle(
                                fontSize: 15,
                                color: AppColours.primaryColor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              product.description ?? '',
                              style: getBodyTextStyle(),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${product.priceAfterDiscount} \$',
                          style: getHeaderTextStyle(),
                        ),
                        Spacer(),
                        CustomButton(
                          fontsize: 20,
                          width: 212,
                          height: 56,
                          text: 'Add To Cart',
                          onpressed: () {
                            context.read<HomeCubit>().addtoCart(
                              HomeRequest(id: product.id),
                            );
                          },
                          bcolor: AppColours.darkColor,
                          tcolor: AppColours.backgroundColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
