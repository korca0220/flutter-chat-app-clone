// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_auth/firebase_auth.dart';

class AuthNotifier extends ChangeNotifier {
  final FirebaseAuth firebaseAuth;

  AuthNotifier({
    required this.firebaseAuth,
  }) {
    if (firebaseAuth.currentUser != null) {
      _user = firebaseAuth.currentUser;
      notifyListeners();
    }
    firebaseAuth.userChanges().listen((user) {
      _user = user;
      notifyListeners();
    });
  }
  User? _user;
  User? get user => _user;

  reload() async {
    _user!.reload();
    notifyListeners();
  }
}
