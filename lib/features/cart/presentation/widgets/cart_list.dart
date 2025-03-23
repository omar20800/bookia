import 'package:bookia/core/widgets/item_seprator.dart';
import 'package:bookia/features/cart/data/model/response/cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({super.key, required this.cartItems, required this.onRemove});
  final List<CartItem> cartItems;
  final Function onRemove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(
            item: cartItems[index],
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
