// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multiple_result/multiple_result.dart';

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show AuthRepository;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show ParamUseCase, Tuple2;

class EmailSignInUseCase extends ParamUseCase<Result<UserCredential, Exception>,
    Tuple2<String, String>> {
  final AuthRepository _repository;
  EmailSignInUseCase(this._repository);

  // param.value1 : Email
  // param.value2 : Password
  @override
  Future<Result<UserCredential, Exception>> call(
      Tuple2<String, String> params) {
    return _repository.signInWithEmail(params.value1, params.value2);
  }
}
