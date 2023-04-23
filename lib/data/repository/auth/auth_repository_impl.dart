// dart
import 'dart:typed_data';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

// api
import 'package:flutter_chat_app_clone/data/source/source.dart' show AuthApi;

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi authApi;
  AuthRepositoryImpl({required this.authApi});

  @override
  Future<Result<UserCredential, Exception>> signInWithGoogle() async {
    final res = await authApi.signInWithGoogle();
    return res.when(
      (userCredential) => Success(userCredential),
      (error) => Error(error),
    );
  }

  @override
  Future<Result<bool, Exception>> signOut() async {
    final res = await authApi.signOut();
    return res.when(
      (success) => Success(success),
      (error) => Error(error),
    );
  }

  @override
  Future<Result<UserCredential, Exception>> signInWithEmail(
      String email, String password) async {
    final res = await authApi.signInWithEmail(email, password);
    return res.when(
      (useCredential) => Success(useCredential),
      (error) => Error(error),
    );
  }

  @override
  Future<Result<UserCredential, Exception>> signUpWithEmail(
      String email, String password) async {
    final res = await authApi.signUpWithEmail(email, password);
    return res.when(
      (useCredential) => Success(useCredential),
      (error) => Error(error),
    );
  }

  @override
  Future<Result<bool, Exception>> profileImageUpload(
      String imageName, Uint8List image) async {
    final res = await authApi.profileImageUpload(imageName, image);
    return res.when(
      (success) => Success(success),
      (error) => Error(error),
    );
  }
}
