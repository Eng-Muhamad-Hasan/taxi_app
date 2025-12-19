import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/features/auth/domain/entities/user_entity.dart';
import 'package:taxi_app/features/auth/domain/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(AuthInitial());
  
  Future signInWithGoogle() async {
    emit(AuthLoading());
    final result = await _authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (userEntity) => emit(
        AuthSuccess(
          userEntity: userEntity,
        ),
      ),
    );
  }
}
