import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/item_seprator.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_list.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class MycartScreen extends StatelessWidget {
  const MycartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: getHeaderTextStyle()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        child: Column(children: [CartList()]),
      ),
    );
  }
}
