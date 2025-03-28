import 'dart:developer';
import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/features/auth/data/model/request/auth_request.dart';
import 'package:bookia/features/auth/data/model/response/auth_response/auth_response.dart';

class AuthRepo {
  Future<AuthResponse?> login(AuthRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'login',
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<AuthResponse?> register(AuthRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'register',
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        return AuthResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> forgotPassword(AuthRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'forget-password',
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> verifyCode(AuthRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'forget-password',
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<Map<String, dynamic>?> resetPassword(AuthRequest params) async {
    try {
      var response = await DioProvider.post(
        endpoint: 'reset-password',
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
