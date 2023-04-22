// packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_event.freezed.dart';

@freezed
class LoginScreenEvent with _$LoginScreenEvent {
  const factory LoginScreenEvent.signInWithEmail(
      String email, String password) = SignInWithEmail;
  const factory LoginScreenEvent.signInWithGoogle() = SignInWithGoogle;
  const factory LoginScreenEvent.signUpWithEmail(
      String email, String password) = SignUpWithEmail;
  const factory LoginScreenEvent.onTapJump(int index) = OnTapJump;
}
