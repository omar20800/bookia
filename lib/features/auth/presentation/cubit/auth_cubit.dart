import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  login(AuthRequest params) async {
    emit(AuthLoading());
    AuthRepo().login(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'Login failed'));
      }
    });
  }

  register(AuthRequest params) async {
    emit(AuthLoading());
    AuthRepo().register(params).then((value) {
      if (value != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(message: 'registration failed'));
      }
    });
  }
}
