import 'dart:developer';

import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/wishlist/data/model/request/wishlist_request.dart';
import 'package:bookia/features/wishlist/data/model/response/wish_list_response/wish_list_response.dart';

class WishlistRepo {
  Future<WishListResponse?> getWishList() async {
    try {
      var response = await DioProvider.get(
        endpoint: 'wishlist',
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedUser('user')?.token}",
        },
      );
      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<WishListResponse?> deleteWishList(WishlistRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'remove-from-wishlist',
        data: params.toJson(),
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedUser('user')?.token}",
        },
      );
      if (response.statusCode == 200) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<WishListResponse?> addtoCart(WishlistRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'add-to-cart',
        data: params.toJson(),
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedUser('user')?.token}",
        },
      );
      if (response.statusCode == 201) {
        return WishListResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
