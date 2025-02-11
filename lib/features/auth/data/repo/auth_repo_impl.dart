import 'dart:developer';

import 'package:Ecommerce/core/errors/exceptions.dart';
import 'package:Ecommerce/core/errors/failures.dart';
import 'package:Ecommerce/core/services/firebase_auth_service.dart';
import 'package:Ecommerce/features/auth/data/models/user_model.dart';
import 'package:Ecommerce/features/auth/domain/entites/user_entity.dart';
import 'package:Ecommerce/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      //await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  /*Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }
*/
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      //var userEntity = await getUserData(uid: user.uid);
      //await saveUserData(user: userEntity);
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    //User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();

      // var userEntity = UserModel.fromFirebaseUser(user);
      // var isUserExist = await databaseService.checkIfDataExists(
      //  path: BackendEndpoint.isUserExists, docuementId: user.uid);
      // if (isUserExist) {
      //   await getUserData(uid: user.uid);
      // } else {
      //  await addUserData(user: userEntity);
      //}
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } catch (e) {
      //await deleteUser(user);
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
}
