import 'package:bookia/features/home/data/model/request/home_request.dart';
import 'package:bookia/features/home/data/model/response/best_seller_response/best_seller_response.dart';
import 'package:bookia/features/home/data/model/response/slider_response/slider_response.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookia/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  SliderResponse? slider;
  BestSellerResponse? bestSeller;

  getSlider() {
    emit(HomeSliderLoading());
    HomeRepo().getSlider().then((value) {
      if (value != null) {
        slider = value;
        emit(HomeSliderSuccess());
      } else {
        emit(HomeSliderError());
      }
    });
  }

  getBestSeller() {
    emit(HomeBestSellerLoading());
    HomeRepo().getBestSeller().then((value) {
      if (value != null) {
        bestSeller = value;
        emit(HomeBestSellerSuccess());
      } else {
        emit(HomeBestSellerError());
      }
    });
  }

  addtoWishList(HomeRequest params) {
    HomeRepo().addtoWishList(params).then((value) {
      if (value != null) {
        emit(AddtoWishListSuccess());
      } else {
        emit(AddtoWishListError());
      }
    });
  }

  addtoCart(HomeRequest params) {
    HomeRepo().addtoCart(params).then((value) {
      if (value != null) {
        emit(AddtoCartSuccess());
      } else {
        emit(AddtoCartError());
      }
    });
  }
}
