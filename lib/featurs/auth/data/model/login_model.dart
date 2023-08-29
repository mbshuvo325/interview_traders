import '../../domain/entities/login_eitity.dart';

class LoginModel extends LoginEntity {
  const LoginModel({required super.result, required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      result: json['result'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result,
      'token': token,
    };
  }
}