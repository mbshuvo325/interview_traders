import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  final bool result;
  final String token;
  const LoginEntity({required this.result, required this.token});

  @override
  List<Object?> get props => [result, token];
}