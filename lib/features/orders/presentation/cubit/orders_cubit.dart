import 'package:bookia/features/orders/data/model/response/get_orders/get_orders_response.dart';
import 'package:bookia/features/orders/data/repo/orders_repo.dart';
import 'package:bookia/features/orders/presentation/cubit/orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersStates> {
  GetOrdersResponse? orders;

  OrdersCubit() : super(OrdersInitial());
  getOrders() async {
    emit(OrdersLoading());
    OrdersRepo().getOrders().then((value) {
      if (value != null) {
        orders = value;
        emit(OrdersSuccess());
      } else {
        emit(OrdersError());
      }
    });
  }
}
