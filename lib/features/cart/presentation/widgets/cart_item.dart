import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/features/cart/data/model/response/cart_response/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onRemove,
    required this.onAdd,
    required this.onMinus,
  });
  final CartItem item;
  final Function() onRemove;
  final Function() onMinus;
  final Function() onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          height: 110,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: item.itemProductImage ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      item.itemProductName ?? '',
                      style: getBodyTextStyle(),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onRemove();
                    },
                    icon: SvgPicture.asset('assets/icons/remove.svg'),
                  ),
                ],
              ),
              Text(
                '${item.itemProductPriceAfterDiscount} \$',
                style: getBodyTextStyle(),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      if (item.itemQuantity! < item.itemProductStock!) {
                        onAdd();
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColours.dividerColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                  SizedBox(width: 2.5),
                  SizedBox(
                    width: 25,
                    child: Text(
                      item.itemQuantity.toString(),
                      style: getBodyTextStyle(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 2.5),
                  InkWell(
                    onTap: () {
                      if (item.itemQuantity! > 1) {
                        onMinus();
                      }
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: AppColours.dividerColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
