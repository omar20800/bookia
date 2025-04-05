import 'package:bookia/core/widgets/item_seprator.dart';
import 'package:bookia/features/cart/data/model/response/cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.cartItems,
    required this.onRemove,
    required this.onAdd,
    required this.onMinus,
  });
  final List<CartItem> cartItems;
  final Function onRemove;
  final Function onMinus;
  final Function onAdd;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(
            item: cartItems[index],
            onMinus: () {
              onMinus(index);
            },
            onAdd: () {
              onAdd(index);
            },
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
