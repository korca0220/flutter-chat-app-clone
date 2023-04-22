// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show AuthRepository;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show NoParamUseCase;

class GoogleSignInUseCase
    extends NoParamUseCase<Result<UserCredential, Exception>> {
  final AuthRepository _repository;
  GoogleSignInUseCase(this._repository);

  @override
  Future<Result<UserCredential, Exception>> call() {
    return _repository.signInWithGoogle();
  }
}
