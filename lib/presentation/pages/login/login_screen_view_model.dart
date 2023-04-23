// dart
import 'dart:async';

// flutter
import 'package:flutter/material.dart';

// event
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_event.dart';

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show LoginUseCase;

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart'
    show Tuple2;

// ui event
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_ui_event.dart';

class LoginScreenViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  LoginScreenViewModel(this.loginUseCase);

  final _eventController = StreamController<LoginScreenUiEvent>.broadcast();
  Stream<LoginScreenUiEvent> get eventStream => _eventController.stream;

  onEvent(LoginScreenEvent event) {
    event.when(
      signInWithEmail: (email, password) => _signInWithEmail(email, password),
      signInWithGoogle: _signInWithGoogle,
      signUpWithEmail: (email, password) => _signUpWithEmail(email, password),
      onTapJump: _onTapJump,
    );
  }

  _onTapJump(int index) {
    _eventController.add(LoginScreenUiEvent.animationToPage(index));
  }

  _onLoading(bool isLoading) {
    _eventController.add(LoginScreenUiEvent.onLoading(isLoading));
  }

  Future<void> _signInWithEmail(String email, String password) async {
    final params = Tuple2<String, String>(email, password);
    _onLoading(true);
    final res = await loginUseCase.emailSignInUseCase(params);
    res.when(
      (success) {
        _onLoading(false);
        _eventController.add(const LoginScreenUiEvent.popPage());
      },
      (error) {
        _onLoading(false);
        _eventController.add(LoginScreenUiEvent.showToast(error.toString()));
      },
    );
  }

  Future<void> _signInWithGoogle() async {
    final res = await loginUseCase.googleSignInUseCase();
    _onLoading(true);
    res.when(
      (success) {
        _onLoading(false);
      },
      (error) {
        _onLoading(false);
        _eventController.add(LoginScreenUiEvent.showToast(error.toString()));
      },
    );
  }

  Future<void> _signUpWithEmail(String email, String password) async {
    final params = Tuple2<String, String>(email, password);
    _onLoading(true);
    final res = await loginUseCase.emailSignUpUseCase(params);
    res.when(
      (success) {
        _onLoading(false);
        _eventController.add(const LoginScreenUiEvent.popPage());
      },
      (error) {
        _onLoading(false);
        _eventController.add(LoginScreenUiEvent.showToast(error.toString()));
      },
    );
  }
}
