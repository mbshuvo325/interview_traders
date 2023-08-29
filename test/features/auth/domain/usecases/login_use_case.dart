
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:traders/featurs/auth/domain/entities/login_eitity.dart';
import 'package:traders/featurs/auth/domain/repositories/auth_repositories.dart';
import 'package:traders/featurs/auth/domain/usecases/login_use_case.dart';

class MocAuthRepository extends Mock implements AuthRepository {}

void main() {
  LoginUseCase? useCase;
  MocAuthRepository? repository;

  setUp(() {
    repository = MocAuthRepository();
    useCase = LoginUseCase(repository!);
  });

  const tLogin = 123456;
  const tPassword = '123456';
  const tLoginEntity = LoginEntity(result: true, token: 'token');

  test("Should get login Entity", () async {
    when(repository!.login(tLogin, tPassword)).thenAnswer((_) async => const Right(tLoginEntity));
    final result = await useCase!(const LoginParams(login: tLogin, password: tPassword));
    expect(result, const Right(tLoginEntity));
    verify(repository!.login(tLogin, tPassword));
    verifyNoMoreInteractions(repository!);
  });

}