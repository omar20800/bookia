import 'package:bookia/core/model/user_model.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:bookia/features/profile/presentation/cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());
  logout() {
    emit(ProfileLoading());
    ProfileRepo().logout()?.then((value) {
      if (value != null) {
        AppLocalStorage.cacheUser('user', UserModel());
        emit(ProfileSuccess());
      } else {
        emit(ProfileError());
      }
    });
  }
}
