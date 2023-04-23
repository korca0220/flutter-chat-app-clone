// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show GetChatDataUseCase, SendMessageUseCase;

class ChatUseCase {
  final GetChatDataUseCase getChatDataUseCase;
  final SendMessageUseCase sendMessageUseCase;
  ChatUseCase({
    required this.getChatDataUseCase,
    required this.sendMessageUseCase,
  });
}
