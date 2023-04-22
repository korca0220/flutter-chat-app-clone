// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show EmailSignInUseCase, EmailSignUpUseCase, GoogleSignInUseCase;

class LoginUseCase {
  final EmailSignInUseCase emailSignInUseCase;
  final EmailSignUpUseCase emailSignUpUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  LoginUseCase({
    required this.emailSignInUseCase,
    required this.emailSignUpUseCase,
    required this.googleSignInUseCase,
  });
}
