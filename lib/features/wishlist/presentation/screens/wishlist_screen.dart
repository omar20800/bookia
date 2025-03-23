import 'package:bookia/features/wishlist/presentation/widgets/wish_list_container.dart';
import 'package:flutter/material.dart';
import 'package:bookia/core/utils/text_style.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: getHeaderTextStyle()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [WishListContainer()],
        ),
      ),
    );
  }
}
