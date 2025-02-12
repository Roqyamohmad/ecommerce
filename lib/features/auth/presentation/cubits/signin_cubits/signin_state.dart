part of 'signin_cubit.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity userEntity;
  final String message;

  SigninSuccess({required this.userEntity, required this.message});
}

final class SigninFailure extends SigninState {
  final String message;

  SigninFailure({required this.message});
}
