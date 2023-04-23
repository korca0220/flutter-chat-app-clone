// packages
import 'package:multiple_result/multiple_result.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart' show Message;

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show ChatRepository;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show ParamUseCase, Tuple2;

class SendMessageUseCase
    extends ParamUseCase<Result<bool, Exception>, Tuple2<String, Message>> {
  final ChatRepository _repository;
  SendMessageUseCase(this._repository);

  @override
  Future<Result<bool, Exception>> call(Tuple2<String, Message> params) async {
    return _repository.sendMessage(params.value1, params.value2);
  }
}
