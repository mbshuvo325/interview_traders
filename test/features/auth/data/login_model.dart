import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:traders/featurs/auth/data/model/login_model.dart';
import 'package:traders/featurs/auth/domain/entities/login_eitity.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const token = "bc3f82405cb2a88d6d7bb7fa86fd89cc8b70c220f5eec1494e8b0a229c317129";
  const loginModel = LoginModel(result: true, token: token);

  test("Should be a subclass of login Entity", () async{
    expect(loginModel, isA<LoginEntity>());
  });
  group("FromJson", () {
    test("Should return valid model when JSON is Success login", () async{
      final Map<String ,dynamic> jsonMap = json.decode(fixture('login_response.json'));
      final result = LoginModel.fromJson(jsonMap);
      expect(result, loginModel);
    });
  });

  group("toJson", () {
    test("should return a JSON map for proper data", () async{
      final result = loginModel.toJson();
      final expectedMap = {
        "result": true,
        "token": token,
      };
      expect(result, expectedMap);
    });
  });
}