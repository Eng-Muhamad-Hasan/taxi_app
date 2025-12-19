import 'package:get_it/get_it.dart';
import 'package:taxi_app/core/services/database_service.dart';
import 'package:taxi_app/core/services/firebase/firebase_auth_service.dart';
import 'package:taxi_app/core/services/firebase/firebase_firestore_service.dart';
import 'package:taxi_app/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:taxi_app/features/auth/domain/repo/auth_repo.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<DatabaseService>(FirebaseFirestoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      databaseService: getIt<DatabaseService>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
