// packages
import 'package:multiple_result/multiple_result.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart'
    show ChatRoom, Message;

abstract class ChatRepository {
  Stream<ChatRoom> getChatRoomData(String chatRoomId);
  Future<Result<bool, Exception>> sendMessage(
      String chatRoomId, Message message);
}
