import 'package:bookia/core/widgets/item_seprator.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          return CartItem();
        },
        separatorBuilder: (context, index) {
          return ItemSeprator();
        },
      ),
    );
  }
}
