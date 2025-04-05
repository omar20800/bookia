import 'package:bookia/features/cart/data/model/request/cart_request.dart';
import 'package:bookia/features/cart/data/model/response/cart_response/cart_response.dart';
import 'package:bookia/features/cart/data/repo/cart_repo.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());

  CartResponse? cart;

  getCart() {
    emit(CartLoading());
    CartRepo().getCart().then((value) {
      if (value != null) {
        cart = value;
        emit(CartSuccess());
      } else {
        emit(CartError());
      }
    });
  }

  removeCart(CartRequest params) {
    emit(CartLoading());
    CartRepo().removeCart(params).then((value) {
      if (value != null) {
        cart = value;
        emit(CartRemoveSuccess());
      } else {
        emit(CartError());
      }
    });
  }

  updateCart(CartRequest params) {
    emit(CartLoading());
    CartRepo().upedateCart(params).then((value) {
      if (value != null) {
        cart = value;
        emit(CartRemoveSuccess());
      } else {
        emit(CartError());
      }
    });
  }
}
