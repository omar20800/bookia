import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/core/utils/appcolour.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: CachedNetworkImageProvider(
            AppLocalStorage.getCachedUser('user')?.image ?? '',
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalStorage.getCachedUser('user')?.name ?? '',
                style: getHeaderTextStyle(fontSize: 20),
              ),
              Text(
                AppLocalStorage.getCachedUser('user')?.email ?? '',
                style: getHeaderTextStyle(
                  fontSize: 14,
                  color: AppColours.grayColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
