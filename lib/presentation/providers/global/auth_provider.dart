// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multiple_result/multiple_result.dart';

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show authUseCaseProvider, firebaseAuthProvider;

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show AuthUseCase;

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  final authUseCase = ref.watch(authUseCaseProvider);
  final firebaseAuth = ref.read(firebaseAuthProvider);
  return AuthNotifier(authUseCase: authUseCase, firebaseAuth: firebaseAuth);
});

class AuthNotifier extends StateNotifier<User?> {
  final AuthUseCase authUseCase;
  final FirebaseAuth firebaseAuth;
  AuthNotifier({
    required this.authUseCase,
    required this.firebaseAuth,
  }) : super(null) {
    if (firebaseAuth.currentUser != null) {
      state = firebaseAuth.currentUser;
    }
  }

  Future<Result<bool, Exception>> signInWithGoogle() async {
    final res = await authUseCase.googleSignInUseCase();
    return res.when(
      (userCredential) {
        state = userCredential.user;
        return const Success(true);
      },
      (error) => Error(error),
    );
  }

  Future<Result<bool, Exception>> signOut() async {
    final res = await authUseCase.singOutUseCase();
    return res.when(
      (success) {
        state = null;
        return Success(success);
      },
      (error) => Error(error),
    );
  }

  Future<Result<bool, Exception>> withDrawalAccount() async {
    try {
      if (state == null) {
        throw Exception('회원 탈퇴 실패!');
      }
      await state!.delete();
      state = null;
      return const Success(true);
    } catch (e) {
      return Error(Exception('회원 탈퇴 실패!'));
    }
  }
}
