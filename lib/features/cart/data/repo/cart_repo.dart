import 'dart:developer';
import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/cart/data/model/request/cart_request.dart';
import 'package:bookia/features/cart/data/model/response/cart_response/cart_response.dart';

class CartRepo {
  Future<CartResponse?> getCart() async {
    try {
      var response = await DioProvider.get(
        endpoint: 'cart',
        headers: {
          'Authorization':
              'Bearer ${AppLocalStorage.getCachedUser('user')?.token}',
        },
      );
      if (response.statusCode == 200) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<CartResponse?> removeCart(CartRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'remove-from-cart',
        data: params.toJson(),
        headers: {
          'Authorization':
              'Bearer ${AppLocalStorage.getCachedUser('user')?.token}',
        },
      );
      if (response.statusCode == 200) {
        return CartResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
