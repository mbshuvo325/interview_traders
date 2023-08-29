import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:traders/core/platform/network_info.dart';
import 'package:traders/featurs/auth/data/data_source/local_data_source.dart';
import 'package:traders/featurs/auth/data/data_source/login_data_source.dart';
import 'package:traders/featurs/auth/data/model/login_model.dart';
import 'package:traders/featurs/auth/data/repository/auth_repository_impl.dart';
import 'package:traders/featurs/auth/domain/entities/login_eitity.dart';

class MockLoginDataSource extends Mock implements LoginDataSource {}

class MockLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {

  AuthRepositoryImpl? repositoryImpl;
  MockLoginDataSource? mockLoginDataSource;
  MockLocalDataSource? mockLocalDataSource;
  MockNetworkInfo? mockNetworkInfo;

  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = AuthRepositoryImpl(
      loginDataSource: mockLoginDataSource!,
      localDataSource: mockLocalDataSource!,
      networkInfo: mockNetworkInfo!,
    );
  });

  group("Login Repository", () {
    const tLogin = 2088888;
    const tPassword = "ral11lod";
    const tLoginModel = LoginModel(result: true, token: "15a14802a3199bc982accb50114d6531b06f9f83d616e4d09f3184cb6e76cf5b");
    const LoginEntity tLoginEntity = tLoginModel;
    test("Should Check if Device is Online", () async{
      when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
      when(mockLoginDataSource!.login(tLogin, tPassword)).thenAnswer((_) async => tLoginModel);
      await repositoryImpl!.login(tLogin, tPassword);
      verify(mockNetworkInfo!.isConnected);
    });

    group("Device is Online", () {
      setUp(() {
        when(mockNetworkInfo!.isConnected).thenAnswer((_) async => true);
      });
      test("Should return login response", () async{
        when(mockLoginDataSource!.login(tLogin, tPassword)).thenAnswer((_) async => tLoginModel);
        final result = await repositoryImpl!.login(tLogin, tPassword);
        verify(mockLoginDataSource!.login(tLogin, tPassword));
        expect(result, equals(const Right(tLoginEntity)));
      });
    });

    group("Device is Offline", () {
      setUp(() {
        when(mockNetworkInfo!.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}