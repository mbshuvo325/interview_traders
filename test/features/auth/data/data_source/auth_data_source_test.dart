
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:traders/featurs/auth/data/data_source/login_data_source.dart';

class MocHttpClient extends Mock implements http.Client {

  void main() {
    LoginDataSourceImpl? mocAuthDataSourceImpl;
    MocHttpClient? mocHttpClient;

    setUp(() {
      mocHttpClient = MocHttpClient();
      mocAuthDataSourceImpl = LoginDataSourceImpl(httpClient: mocHttpClient!);
    });
  }
}