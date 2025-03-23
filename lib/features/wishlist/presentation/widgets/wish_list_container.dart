import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/widgets/item_seprator.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:bookia/features/wishlist/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          return WishListItem();
        },
        separatorBuilder: (context, index) {
          return ItemSeprator();
        },
      ),
    );
  }
}
