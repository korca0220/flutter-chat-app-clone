// dart
import 'dart:typed_data';

// flutter
import 'package:flutter/material.dart';

// packages
import 'package:image_picker/image_picker.dart';

// interface
import 'package:flutter_chat_app_clone/global/interface/interface.dart';

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show ProfileUseCase;

class ProfileViewModel extends ChangeNotifier {
  final ProfileUseCase profileUseCase;
  ProfileViewModel(this.profileUseCase);
  Future<void> signOut() async {
    final res = await profileUseCase.singOutUseCase();
    res.when(
      (success) => null,
      (error) => null,
    );
  }

  Future<void> profileImageUpload(String imageName) async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final imageByte = await image.readAsBytes();
      final params = Tuple2<String, Uint8List>(imageName, imageByte);
      final res = await profileUseCase.profileImageUploadUseCase(params);
      res.when(
        (success) => null,
        (error) => null,
      );
    }
    notifyListeners();
  }
}
