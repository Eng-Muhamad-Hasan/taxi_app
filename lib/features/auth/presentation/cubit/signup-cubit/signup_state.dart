part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;
  final String successMessage;
  @override
  List<Object> get props => [userEntity];
  const SignupSuccess({required this.userEntity, required this.successMessage});
}

final class SignupFailure extends SignupState {
  final String errorMessage;
  const SignupFailure(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
