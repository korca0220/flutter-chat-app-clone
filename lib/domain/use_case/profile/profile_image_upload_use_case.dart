// dart
import 'dart:typed_data';

// packages
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart';
import 'package:multiple_result/multiple_result.dart';

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show AuthRepository;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show ParamUseCase, Tuple2;

class ProfileImageUploadUseCase
    extends ParamUseCase<Result<bool, Exception>, Tuple2<String, Uint8List>> {
  final AuthRepository _repository;
  final AuthNotifier _authProvider;
  ProfileImageUploadUseCase(this._repository, this._authProvider);

  @override
  Future<Result<bool, Exception>> call(Tuple2<String, Uint8List> params) async {
    await _authProvider.reload();
    return _repository.profileImageUpload(params.value1, params.value2);
  }
}
