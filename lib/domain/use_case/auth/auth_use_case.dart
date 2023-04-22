// use case
import 'package:flutter_chat_app_clone/domain/use_case/auth/email_sign_in_use_case.dart';
import 'package:flutter_chat_app_clone/domain/use_case/auth/email_sign_up_use_case.dart';
import 'package:flutter_chat_app_clone/domain/use_case/auth/google_sign_in_use_case.dart';
import 'package:flutter_chat_app_clone/domain/use_case/auth/sign_out_use_case.dart';

class AuthUseCase {
  final EmailSignInUseCase emailSignInUseCase;
  final EmailSignUpUseCase emailSignUpUseCase;
  final GoogleSignInUseCase googleSignInUseCase;
  final SingOutUseCase singOutUseCase;
  AuthUseCase({
    required this.googleSignInUseCase,
    required this.singOutUseCase,
    required this.emailSignInUseCase,
    required this.emailSignUpUseCase,
  });
}
