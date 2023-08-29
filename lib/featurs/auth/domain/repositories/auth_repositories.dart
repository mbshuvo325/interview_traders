import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/login_eitity.dart';

abstract class AuthRepository {
  Future<Either<Failure,LoginEntity>?>? login(int login, String password);
  Future<void> logout();
}