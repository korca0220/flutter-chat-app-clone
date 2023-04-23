// model
import 'package:flutter_chat_app_clone/domain/model/model.dart' show ChatRoom;

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show ChatRepository;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show ParamUseCaseStream;

class GetChatDataUseCase extends ParamUseCaseStream<ChatRoom, String> {
  final ChatRepository _repository;
  GetChatDataUseCase(this._repository);

  @override
  Stream<ChatRoom> call(String value) {
    return _repository.getChatRoomData(value);
  }
}
