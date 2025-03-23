import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:bookia/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WishListItem extends StatelessWidget {
  const WishListItem({super.key});

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
            child: Image.asset(
              'assets/images/book-cover.png',
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
                    child: Text('The Republic', style: getBodyTextStyle()),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/icons/remove.svg'),
                  ),
                ],
              ),
              Text('₹285', style: getBodyTextStyle()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    width: 150,
                    height: 40,
                    text: 'Add to Cart',
                    onpressed: () {},
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
