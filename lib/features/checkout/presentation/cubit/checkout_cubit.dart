import 'package:bookia/features/checkout/data/model/request/place_order_request.dart';
import 'package:bookia/features/checkout/data/repo/checkout_repo.dart';
import 'package:bookia/features/checkout/presentation/cubit/checkout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCubit extends Cubit<CheckoutStates> {
  CheckoutCubit() : super(CheckoutInitialState());

  checkout() {
    emit(CheckoutLoadingState());
    CheckoutRepo().checkout().then((value) {
      if (value != null) {
        emit(CheckoutSuccessState());
      } else {
        emit(CheckoutErrorState());
      }
    });
  }

  placeOrder(PlaceOrderRequest params) {
    emit(PlaceOrderLoadingState());
    CheckoutRepo().placeOrder(params).then((value) {
      if (value != null) {
        emit(PlaceOrderSuccessState());
      } else {
        emit(PlaceOrderErrorState());
      }
    });
  }
}
