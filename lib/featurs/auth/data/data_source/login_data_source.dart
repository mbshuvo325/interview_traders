import 'package:http/http.dart' as http;
import '../model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel>? login(int login, String password);
}
class LoginDataSourceImpl implements LoginDataSource {
  final http.Client? httpClient;
  LoginDataSourceImpl({this.httpClient});
  @override
  Future<LoginModel>? login(int login, String password) {
    return null;
  }
}