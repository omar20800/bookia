import 'package:bookia/features/wishlist/data/model/request/wishlist_request.dart';
import 'package:bookia/features/wishlist/data/model/response/wish_list_response/wish_list_response.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  WishlistCubit() : super(WishListInitial());

  WishListResponse? wishListResponse;

  getWishList() {
    emit(WishListLoading());
    WishlistRepo().getWishList().then((value) {
      if (value != null) {
        wishListResponse = value;
        emit(WishListSuccess());
      } else {
        emit(WishListError());
      }
    });
  }

  removeItem(WishlistRequest params) {
    emit(WishListLoading());
    WishlistRepo().deleteWishList(params).then((value) {
      if (value != null) {
        wishListResponse = value;
        emit(WishListSuccess());
      } else {
        emit(WishListError());
      }
    });
  }
  addtoCart(WishlistRequest params) {
    WishlistRepo().addtoCart(params).then((value) {
      if (value != null) {
        emit(WishListSuccess());
      } else {
        emit(WishListError());
      }
    });
  }
}
