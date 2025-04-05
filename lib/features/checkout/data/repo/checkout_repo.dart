import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/checkout/data/model/request/place_order_request.dart';
import 'package:bookia/features/checkout/data/model/response/get_governorates_response/get_governorates_response.dart';

class CheckoutRepo {
  Future<GetGovernoratesResponse?> getGovernorates() async {
    var response = await DioProvider.get(endpoint: 'governorates');
    if (response.statusCode == 200) {
      return GetGovernoratesResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future checkout() async {
    var response = await DioProvider.get(
      endpoint: 'checkout',
      headers: {
        'Authorization':
            'Bearer ${AppLocalStorage.getCachedUser('user')?.token}',
      },
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future placeOrder(PlaceOrderRequest params) async {
    var response = await DioProvider.post(
      endpoint: 'place-order',
      headers: {
        'Authorization':
            'Bearer ${AppLocalStorage.getCachedUser('user')?.token}',
      },
      data: params.toJson(),
    );
    if (response.statusCode == 201) {
      return response.data;
    } else {
      return null;
    }
  }
}
