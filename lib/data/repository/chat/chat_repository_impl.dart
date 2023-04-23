// packages
import 'package:multiple_result/multiple_result.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart'
    show ChatRoom, Message;

// api
import 'package:flutter_chat_app_clone/data/source/source.dart' show ChatApi;

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show ChatRepository;

class ChatRepositoryImpl implements ChatRepository {
  final ChatApi chatApi;
  ChatRepositoryImpl(this.chatApi);

  @override
  Stream<ChatRoom> getChatRoomData(String chatRoomId) {
    return chatApi.getChatRoomData(chatRoomId);
  }

  @override
  Future<Result<bool, Exception>> sendMessage(
      String chatRoomId, Message message) async {
    final res = await chatApi.sendMessage(message, chatRoomId);
    return res.when(
      (success) => Success(success),
      (error) => Error(error),
    );
  }
}
