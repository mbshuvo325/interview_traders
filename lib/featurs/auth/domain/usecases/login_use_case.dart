import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/login_eitity.dart';
import '../repositories/auth_repositories.dart';

class LoginUseCase implements UseCase<LoginEntity, LoginParams> {
  final AuthRepository? repository;
  LoginUseCase(this.repository);

  @override
  Future<Either<Failure,LoginEntity>?>? call(LoginParams params) async {
    return await repository!.login(params.login,params.password)!;
  }
}

class LoginParams extends Equatable{
  final int login;
  final String password;
  const LoginParams({required this.login, required this.password});

  @override
  List<Object?> get props => [login, password];
}