// packages
import 'package:multiple_result/multiple_result.dart';

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show AuthRepository;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show NoParamUseCase;

class SingOutUseCase extends NoParamUseCase<Result<bool, Exception>> {
  final AuthRepository _repository;
  SingOutUseCase(this._repository);

  @override
  Future<Result<bool, Exception>> call() {
    return _repository.signOut();
  }
}
