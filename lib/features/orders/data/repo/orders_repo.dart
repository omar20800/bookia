import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/orders/data/model/response/get_orders/get_orders_response.dart';

class OrdersRepo {
  Future<GetOrdersResponse?> getOrders() async {
    var response = await DioProvider.get(
      endpoint: 'order-history',
      headers: {
        'Authorization':
            'Bearer ${AppLocalStorage.getCachedUser('user')?.token}',
      },
    );
    if (response.statusCode == 200) {
      return GetOrdersResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
