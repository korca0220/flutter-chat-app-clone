// dart
import 'dart:async';

// flutter
import 'package:flutter/foundation.dart';

// model
import 'package:flutter_chat_app_clone/domain/model/model.dart'
    show ChatRoom, Message;

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show ChatUseCase;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show Tuple2;

class ChatViewModel extends ChangeNotifier {
  final ChatUseCase chatUseCase;
  ChatViewModel(this.chatUseCase);

  Stream<ChatRoom> getChatList(String chatRoomId) {
    return chatUseCase.getChatDataUseCase(chatRoomId);
  }

  Future<void> sendMessage(String chatRoomId, Message message) async {
    final params = Tuple2<String, Message>(chatRoomId, message);
    final res = await chatUseCase.sendMessageUseCase(params);
    res.when(
      (success) => success,
      (error) => null,
    );
  }
}
