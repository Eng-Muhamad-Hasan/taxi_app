import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_app/core/constants/constants.dart';
import 'package:taxi_app/core/errors/exceptions.dart';
import 'package:taxi_app/core/errors/failures.dart';
import 'package:taxi_app/core/services/database_service.dart';
import 'package:taxi_app/core/services/firebase/firebase_auth_service.dart';
import 'package:taxi_app/core/services/shared_preferences_singleton.dart';
import 'package:taxi_app/core/utils/backend_endpoints.dart';
import 'package:taxi_app/features/auth/data/model/user_model.dart';
import 'package:taxi_app/features/auth/domain/entities/user_entity.dart';
import 'package:taxi_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
            final userEntity = UserEntity(email: email, name: name, uid: user.uid);

      //? logic to add user data in firestore can be added here
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userEntity = await getUserData(uid: user.uid);
      //? logic to save user data in local storage here
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure("حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      final userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);
      bool isUserExist = await databaseService.checkIfDataExists(
        path: BackendEndpoints.getUserEndpoint,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
      }else{
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    }  catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
    
      return left(ServerFailure(
          "حدث خطأ ما أثناء تسجيل الدخول باستخدام غوغل , يرجى المحاولة في وقت اخر",
        ));
      // return left(ServerFailure(e.message));
    } 
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserEndpoint,
      data: UserModel.fromUserEntity(user).toJson(),
      documentId: user.uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    final userData =await databaseService.getData(
      path: BackendEndpoints.getUserEndpoint,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    final jsonData = jsonEncode(UserModel.fromUserEntity(user).toJson());
    return await Prefs.setString(kUserDataKey, jsonData);
  }
}
