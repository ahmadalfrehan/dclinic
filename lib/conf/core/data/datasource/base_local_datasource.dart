import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseLocalDataSource {
  Future<bool> storeToken(String token);

  Future<bool> storeRememberMe(bool remember);

  Future<bool> removeToken(String token);

  Future<bool> storeFcmToken(String token);

  Future<String?> getToken();

  Future<bool?> getRememberMe();

  // Future<bool> storeUser(UserResponseModel user);

  Future<bool> logOutUser();
}

class BaseLocalDataSourceImpl extends BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String?> getToken() async {
    // return sharedPreferences.getString(SharedPrefKeys.TOKEN);
  }

  @override
  Future<bool> storeFcmToken(String token) {
    // TODO: implement storeFcmToken
    throw UnimplementedError();
  }

  @override
  Future<bool> storeToken(String token) async {
    throw UnimplementedError();
    // return await sharedPreferences.setString(SharedPrefKeys.TOKEN, token);
  }

  @override
  Future<bool> logOutUser() async {
    throw UnimplementedError();
    // return await sharedPreferences.remove(SharedPrefKeys.REMEMBER);
  }

  // @override
  // Future<bool> storeUser(UserResponseModel user) async {
  //   return await sharedPreferences.setString(
  //       SharedPrefKeys.USER, json.encode(user));
  // }

  @override
  Future<bool> removeToken(String token) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> storeRememberMe(bool remember) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> getRememberMe() async {
    throw UnimplementedError();
  }
}
