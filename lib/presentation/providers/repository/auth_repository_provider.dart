// packages
import 'package:hooks_riverpod/hooks_riverpod.dart';

// repository
import 'package:flutter_chat_app_clone/data/repository/repository.dart'
    show AuthRepositoryImpl;

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show firebaseAuthProvider;

// source
import 'package:flutter_chat_app_clone/data/source/source.dart' show AuthApi;

final authRepositoryProvider = Provider(
  (ref) {
    final firebaseAuth = ref.read(firebaseAuthProvider);
    final authApi = AuthApi(firebaseAuth: firebaseAuth);
    return AuthRepositoryImpl(authApi: authApi);
  },
);
