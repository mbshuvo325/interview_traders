import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List<dynamic>? properties;
  const Failure([this.properties]);

  @override
  List<Object?> get props => [properties];
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure({required this.message});
}

class CacheFailure extends Failure {
  final String message;
  const CacheFailure({required this.message});
}