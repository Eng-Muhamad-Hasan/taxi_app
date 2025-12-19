part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserEntity userEntity;
  @override
  List<Object> get props => [userEntity];
  const AuthSuccess({required this.userEntity});
}

final class AuthFailure extends AuthState {
  final String errorMessage;
  const AuthFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
