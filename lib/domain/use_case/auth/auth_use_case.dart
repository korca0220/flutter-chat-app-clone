// use case
import 'package:flutter_chat_app_clone/domain/use_case/auth/sign_out_use_case.dart';

class AuthUseCase {
  final SingOutUseCase singOutUseCase;
  AuthUseCase({
    required this.singOutUseCase,
  });
}
