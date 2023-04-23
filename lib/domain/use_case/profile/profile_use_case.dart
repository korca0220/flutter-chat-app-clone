// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show ProfileImageUploadUseCase, SingOutUseCase;

class ProfileUseCase {
  final SingOutUseCase singOutUseCase;
  final ProfileImageUploadUseCase profileImageUploadUseCase;
  ProfileUseCase({
    required this.singOutUseCase,
    required this.profileImageUploadUseCase,
  });
}
