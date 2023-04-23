// dart
import 'dart:typed_data';

// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:multiple_result/multiple_result.dart';

class AuthApi {
  final FirebaseAuth firebaseAuth;
  final FirebaseStorage firebaseStorage;
  AuthApi({required this.firebaseAuth, required this.firebaseStorage});

  Future<Result<UserCredential, Exception>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return Success(userCredential);
    } on FirebaseAuthException catch (e) {
      return Error(e);
    }
  }

  Future<Result<UserCredential, Exception>> signUpWithEmail(
      String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(e);
    }
  }

  Future<Result<UserCredential, Exception>> signInWithEmail(
      String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return Success(credential);
    } on FirebaseAuthException catch (e) {
      return Error(e);
    }
  }

  Future<Result<bool, Exception>> signOut() async {
    try {
      await firebaseAuth.signOut();
      return const Success(true);
    } on FirebaseAuthException catch (e) {
      return Error(e);
    }
  }

  Future<Result<bool, Exception>> profileImageUpload(
      String imageName, Uint8List image) async {
    try {
      TaskSnapshot task = await firebaseStorage
          .ref()
          .child('profileImage')
          .child(imageName)
          .putData(image);
      var downLoadUrl = await task.ref.getDownloadURL();

      await firebaseAuth.currentUser!.updatePhotoURL(downLoadUrl);
      return const Success(true);
    } on FirebaseException catch (e) {
      return Error(e);
    }
  }
}
