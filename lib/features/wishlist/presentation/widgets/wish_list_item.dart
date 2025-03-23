import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/wishlist/data/model/request/wishlist_request.dart';
import 'package:bookia/features/wishlist/data/model/response/wish_list_response/datum.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bookia/core/functions/discount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key, required this.item, required this.onRemove, required this.onAddToCart});
  final Datum item;
  final Function() onRemove;
  final Function() onAddToCart;

  @override
  Widget build(BuildContext context) {
    int price = discountCalculate(
      discount: item.discount ?? 0,
      price: double.parse(item.price ?? '1'),
    );
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
              imageUrl: item.image ?? '',
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
                      item.name ?? '',
                      style: getBodyTextStyle(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
              Text('$price \$', style: getBodyTextStyle()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    width: 150,
                    height: 40,
                    text: 'Add to Cart',
                    onpressed: () {
                      onAddToCart();
                    },
                    bcolor: AppColours.primaryColor,
                    tcolor: AppColours.backgroundColor,
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
