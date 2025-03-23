import 'package:bookia/core/utils/appcolour.dart';
import 'package:flutter/material.dart';

class ItemSeprator extends StatelessWidget {
  const ItemSeprator({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(thickness: 1, color: AppColours.dividerColor);
  }
}
