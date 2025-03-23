import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:bookia/features/home/data/model/request/home_request.dart';
import 'package:bookia/features/home/data/model/response/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBookTile extends StatelessWidget {
  const HomeBookTile({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, right: 11, left: 11, bottom: 11),
      decoration: BoxDecoration(
        color: AppColours.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: product.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Hero(
            tag: product.name.toString(),
            child: Text(
              product.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getBodyTextStyle(),
            ),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                '${product.priceAfterDiscount.toString()} \$',
                style: getBodyTextStyle(fontSize: 16),
              ),
              Spacer(),
              CustomButton(
                fontsize: 18,
                width: 80,
                height: 30,
                text: 'Buy',
                onpressed: () {
                  context.read<HomeCubit>().addtoCart(
                    HomeRequest(id: product.id),
                  );
                },
                bcolor: AppColours.darkColor,
                tcolor: AppColours.backgroundColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
