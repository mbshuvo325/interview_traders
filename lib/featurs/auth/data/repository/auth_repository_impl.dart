
import 'package:dartz/dartz.dart';
import 'package:traders/core/error/exceptions.dart';
import 'package:traders/core/error/failure.dart';
import 'package:traders/featurs/auth/data/data_source/local_data_source.dart';
import 'package:traders/featurs/auth/data/model/login_model.dart';
import 'package:traders/featurs/auth/domain/entities/login_eitity.dart';
import 'package:traders/featurs/auth/domain/repositories/auth_repositories.dart';

import '../../../../core/platform/network_info.dart';
import '../data_source/login_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{
  final LoginDataSource loginDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo? networkInfo;

  AuthRepositoryImpl({
    required this.loginDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure,LoginEntity>?>? login(int login, String password) async{
    // if(await networkInfo.isConnected!){
    //   try{
    //     final result = await loginDataSource.login(login, password);
    //     //localDataSource.cacheToken(result!.token);
    //     LoginModel loginModel = const LoginModel(result: true, token: "khjsdfusbhjf");
    //     return Right(loginModel);
    //   }on ServerException catch(_){
    //     return const Left(ServerFailure(message: 'ServerException'));
    //   }
    // }else{
    //   return const Left(ServerFailure(message: 'Network Failure'));
    // }
    await networkInfo!.isConnected!;
    final result = await loginDataSource.login(login, password);
    localDataSource.cacheToken(result!.token);
    return Right(result);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

}