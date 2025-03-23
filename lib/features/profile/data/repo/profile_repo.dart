import 'dart:developer';
import 'package:bookia/core/service/dio_provider.dart';
import 'package:bookia/core/service/local_helper.dart';

class ProfileRepo {
  Future<dynamic>? logout() async {
    try {
      var response = await DioProvider.post(
        endpoint: 'logout',
        headers: {
          "Authorization":
              "Bearer ${AppLocalStorage.getCachedUser('user')?.token}",
        },
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
