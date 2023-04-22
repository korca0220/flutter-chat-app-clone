// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class AuthRepository {
  Future<Result<UserCredential, Exception>> signInWithGoogle();
  Future<Result<UserCredential, Exception>> signInWithEmail(
      String email, String password);
  Future<Result<UserCredential, Exception>> signUpWithEmail(
      String email, String password);
  Future<Result<bool, Exception>> signOut();
}
