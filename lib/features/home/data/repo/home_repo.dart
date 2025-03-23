import 'dart:developer';

import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/features/home/data/model/request/home_request.dart';
import 'package:bookia/features/home/data/model/response/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/model/response/slider_response/slider_response.dart';

class HomeRepo {
  Future<SliderResponse?> getSlider() async {
    try {
      var response = await DioProvider.get(endpoint: 'sliders');
      if (response.statusCode == 200) {
        return SliderResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<BestSellerResponse?> getBestSeller() async {
    try {
      var response = await DioProvider.get(endpoint: 'products-bestseller');
      if (response.statusCode == 200) {
        return BestSellerResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> addtoWishList(HomeRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'add-to-wishlist',
        data: params.toJson(),
        headers: {
          "Authorization":
              "Bearer 6452|mvSg8Y90wDSiTzedCS1oXWDARgv2AAlwJFssfN4N",
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> addtoCart(HomeRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'add-to-cart',
        data: params.toJson(),
        headers: {
          "Authorization":
              "Bearer 6452|mvSg8Y90wDSiTzedCS1oXWDARgv2AAlwJFssfN4N",
        },
      );
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
