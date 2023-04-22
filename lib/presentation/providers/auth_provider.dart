// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show AuthUseCase;

class AuthNotifier extends ChangeNotifier {
  final AuthUseCase authUseCase;
  final FirebaseAuth firebaseAuth;

  AuthNotifier({
    required this.authUseCase,
    required this.firebaseAuth,
  }) {
    if (firebaseAuth.currentUser != null) {
      _user = firebaseAuth.currentUser;
    }
    firebaseAuth.authStateChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }
  User? _user;
  User? get user => _user;

  Future<Result<bool, Exception>> signOut() async {
    final res = await authUseCase.singOutUseCase();
    return res.when(
      (success) {
        _user = null;
        return Success(success);
      },
      (error) => Error(error),
    );
  }

  Future<Result<bool, Exception>> withDrawalAccount() async {
    try {
      if (_user == null) {
        throw Exception('회원 탈퇴 실패!');
      }
      await _user!.delete();
      _user = null;
      return const Success(true);
    } catch (e) {
      return Error(Exception('회원 탈퇴 실패!'));
    }
  }
}
