import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/features/wishlist/data/model/request/wishlist_request.dart';
import 'package:bookia/features/wishlist/data/model/response/wish_list_response/datum.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wish_list_container.dart';
import 'package:flutter/material.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishlistCubit()..getWishList(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wishlist', style: getHeaderTextStyle()),
          centerTitle: true,
        ),
        body: BlocBuilder<WishlistCubit, WishlistStates>(
          buildWhen:
              (_, state) =>
                  state is WishListSuccess ||
                  state is WishListLoading ||
                  state is WishListError,
          builder: (context, state) {
            if (state is WishListLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColours.primaryColor,
                ),
              );
            }
            List<Datum> wishList =
                context.read<WishlistCubit>().wishListResponse?.data?.data ??
                [];
            if (List<Datum>.from(wishList).isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty.png',
                      color: AppColours.primaryColor,
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  WishListContainer(
                    onAddtoCart: (index) {
                      context.read<WishlistCubit>().addtoCart(
                        WishlistRequest(id: wishList[index].id),
                      );
                    },
                    wishList: wishList,
                    onRemove: (index) {
                      context.read<WishlistCubit>().removeItem(
                        WishlistRequest(id: wishList[index].id),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
