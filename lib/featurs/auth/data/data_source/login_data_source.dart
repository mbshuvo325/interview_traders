import '../model/login_model.dart';

abstract class LoginDataSource {
  Future<LoginModel>? login(int login, String password);
}