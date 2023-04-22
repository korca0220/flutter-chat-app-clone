// packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_screen_ui_event.freezed.dart';

@freezed
class LoginScreenUiEvent with _$LoginScreenUiEvent {
  const factory LoginScreenUiEvent.routePage(String routeName) = RoutePage;
  const factory LoginScreenUiEvent.popPage() = PopPage;
  const factory LoginScreenUiEvent.showToast(String message) = ShowToast;
  const factory LoginScreenUiEvent.animationToPage(int index) = AnimationToPage;
  const factory LoginScreenUiEvent.onLoading(bool isLoading) = OnLoading;
}
