
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traders/core/error/failure.dart';

abstract class AuthLocalDataSource{
  Future<bool>? cacheToken(String token);
  Future<String>? getToken();
  Future<void> deleteToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource{
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool>? cacheToken(String token) {
    return sharedPreferences.setString("token", token);
  }

  @override
  Future<String>? getToken() {
    final token = sharedPreferences.getString("token");
    if(token != null){
      return Future.value(token);
    }else{
      throw const ServerFailure(message: "error");
    }
  }

  @override
  Future<void> deleteToken() {
    return sharedPreferences.remove("token");
  }
}