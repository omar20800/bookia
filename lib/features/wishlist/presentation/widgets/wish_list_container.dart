import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/widgets/item_seprator.dart';
import 'package:bookia/features/wishlist/data/model/response/wish_list_response/datum.dart';

import 'package:bookia/features/wishlist/presentation/widgets/wish_list_item.dart';
import 'package:flutter/material.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({
    super.key,
    required this.wishList,
    required this.onRemove,
    required this.onAddtoCart,
  });
  final List<Datum> wishList;
  final Function onRemove;
  final Function onAddtoCart;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: wishList.length,
        itemBuilder: (context, index) {
          return WishListItem(
            onAddToCart: () {
              onAddtoCart(index);
            },
            item: wishList[index],
            onRemove: () {
              onRemove(index);
            },
          );
        },
        separatorBuilder: (context, index) {
          return ItemSeprator();
        },
      ),
    );
  }
}
