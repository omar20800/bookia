// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bookia/core/model/user_model.dart';
import 'package:hive/hive.dart';

class AppLocalStorage {
  static Box<UserModel>? userBox;

  static init() {
    userBox = Hive.box<UserModel>("userBox");
  }

  static cacheUser(String key, UserModel value) async {
    await userBox?.put(key, value);
  }

  static UserModel? getCachedUser(String key) {
    return userBox?.get(key);
  }
}
