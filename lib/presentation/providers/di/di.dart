// packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_app_clone/domain/use_case/login/login_use_case.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_view_model.dart';
import 'package:flutter_chat_app_clone/presentation/providers/route_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// api
import 'package:flutter_chat_app_clone/data/source/source.dart' show AuthApi;

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show AuthNotifier;

// repository impl
import 'package:flutter_chat_app_clone/data/repository/repository.dart'
    show AuthRepositoryImpl;

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show AuthRepository;

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show
        AuthUseCase,
        EmailSignInUseCase,
        EmailSignUpUseCase,
        GoogleSignInUseCase,
        SingOutUseCase;

Future<List<SingleChildWidget>> getProviders() async {
  // FIrebaseAuth
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Auth
  AuthApi authApi = AuthApi(firebaseAuth: firebaseAuth);
  AuthRepository authRepository = AuthRepositoryImpl(authApi: authApi);
  AuthUseCase authUseCase = AuthUseCase(
    singOutUseCase: SingOutUseCase(authRepository),
  );

  AuthNotifier authProvider = AuthNotifier(
    authUseCase: authUseCase,
    firebaseAuth: firebaseAuth,
  );

  // Login
  LoginUseCase loginUseCase = LoginUseCase(
    emailSignInUseCase: EmailSignInUseCase(authRepository),
    emailSignUpUseCase: EmailSignUpUseCase(authRepository),
    googleSignInUseCase: GoogleSignInUseCase(authRepository),
  );

  // ViewModel
  LoginScreenViewModel loginScreenViewModel =
      LoginScreenViewModel(loginUseCase);

  final RouteNotifier routeNotifier = RouteNotifier();
  return [
    ChangeNotifierProvider(create: (_) => authProvider),
    ChangeNotifierProvider(create: (_) => loginScreenViewModel),
    ChangeNotifierProvider(create: (_) => routeNotifier),
  ];
}
