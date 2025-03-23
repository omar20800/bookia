import 'package:bookia/core/model/user_model.dart';
import 'package:bookia/core/service/local_helper.dart';
import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  login(AuthRequest params) {
    emit(AuthLoading());
    AuthRepo().login(params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheUser(
          'user',
          UserModel(
            id: value.data?.user?.id ?? 0,
            name: value.data?.user?.name ?? '',
            email: value.data?.user?.email ?? '',
            address: value.data?.user?.address ?? '',
            city: value.data?.user?.city ?? '',
            phone: value.data?.user?.phone ?? '',
            emailVerified: value.data?.user?.emailVerified ?? false,
            image: value.data?.user?.image ?? '',
            token: value.data?.token ?? '',
          ),
        );
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'login failed'));
      }
    });
  }

  register(AuthRequest params) {
    emit(AuthLoading());
    AuthRepo().register(params).then((value) {
      if (value != null) {
        AppLocalStorage.cacheUser(
          'user',
          UserModel(
            id: value.data?.user?.id ?? 0,
            name: value.data?.user?.name ?? '',
            email: value.data?.user?.email ?? '',
            address: value.data?.user?.address ?? '',
            city: value.data?.user?.city ?? '',
            phone: value.data?.user?.phone ?? '',
            emailVerified: value.data?.user?.emailVerified ?? false,
            image: value.data?.user?.image ?? '',
            token: value.data?.token ?? '',
          ),
        );
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'registration failed'));
      }
    });
  }

  forgotPassword(AuthRequest params) {
    emit(AuthLoading());
    AuthRepo().forgotPassword(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'sending email failed'));
      }
    });
  }

  verifyCode(AuthRequest params) {
    emit(AuthLoading());
    AuthRepo().verifyCode(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'invalid code'));
      }
    });
  }

  resendCode(AuthRequest params) {
    emit(AuthLoading());
    AuthRepo().verifyCode(params).then((value) {
      if (value != null) {
        emit(AuthCodeResent());
      } else {
        emit(AuthError(message: 'resending code failed'));
      }
    });
  }

  resetPassword(AuthRequest params) {
    emit(AuthLoading());
    AuthRepo().resetPassword(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'password reset failed'));
      }
    });
  }
}
