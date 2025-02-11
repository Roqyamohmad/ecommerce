import 'package:Ecommerce/core/services/firebase_auth_service.dart';
import 'package:Ecommerce/features/auth/data/repo/auth_repo_impl.dart';
import 'package:Ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  //getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    //  databaseService: getIt<DatabaseService>(),
    ),
  );
}
