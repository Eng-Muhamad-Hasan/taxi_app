import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app/features/auth/domain/entities/user_entity.dart';
import 'package:taxi_app/features/auth/domain/repo/auth_repo.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo _authRepo;
  SignupCubit(this._authRepo) : super(SignupInitial());
  Future signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await _authRepo.createUserWithEmailAndPassword(
      name,
      email,
      password,
    );
    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (userEntity) => emit(
        SignupSuccess(
          userEntity: userEntity,
          successMessage: 'تم إنشاء الحساب بنجاح',
        ),
      ),
    );
  }
}
