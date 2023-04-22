// packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show authRepositoryProvider;

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show
        AuthUseCase,
        EmailSignInUseCase,
        EmailSignUpUseCase,
        GoogleSignInUseCase,
        SingOutUseCase;

final authUseCaseProvider = Provider((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthUseCase(
    emailSignInUseCase: EmailSignInUseCase(repository),
    emailSignUpUseCase: EmailSignUpUseCase(repository),
    googleSignInUseCase: GoogleSignInUseCase(repository),
    singOutUseCase: SingOutUseCase(repository),
  );
});
