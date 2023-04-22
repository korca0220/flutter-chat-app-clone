// flutter
import 'package:flutter/material.dart';

// package
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 로그인 중인 사용자 객체
  User? _user;
  User? get user => _user;

  FirebaseAuthProvider() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners(); // 사용자 인증 상태 변경을 알림
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // 로그인 실패 처리
      print(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
