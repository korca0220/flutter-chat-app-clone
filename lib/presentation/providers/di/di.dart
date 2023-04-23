// packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// api
import 'package:flutter_chat_app_clone/data/source/source.dart'
    show AuthApi, ChatApi;

// provider
import 'package:flutter_chat_app_clone/presentation/providers/provider.dart'
    show AuthNotifier, RouteNotifier;

// repository impl
import 'package:flutter_chat_app_clone/data/repository/repository.dart'
    show AuthRepositoryImpl;

// repository interface
import 'package:flutter_chat_app_clone/domain/repository/repository.dart'
    show AuthRepository, ChatRepository;

// use case
import 'package:flutter_chat_app_clone/domain/use_case/use_case.dart'
    show
        ChatUseCase,
        EmailSignInUseCase,
        EmailSignUpUseCase,
        GetChatDataUseCase,
        GoogleSignInUseCase,
        LoginUseCase,
        ProfileImageUploadUseCase,
        ProfileUseCase,
        SendMessageUseCase,
        SingOutUseCase;

// view model
import 'package:flutter_chat_app_clone/presentation/pages/chat/chat_view_model.dart';
import 'package:flutter_chat_app_clone/presentation/pages/login/login_screen_view_model.dart';
import 'package:flutter_chat_app_clone/presentation/pages/profile/profile_view_model.dart';

import '../../../data/repository/chat/chat_repository_impl.dart';

Future<List<SingleChildWidget>> getProviders() async {
  // FIrebaseInstance
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  // Auth
  AuthApi authApi =
      AuthApi(firebaseAuth: firebaseAuth, firebaseStorage: firebaseStorage);
  AuthRepository authRepository = AuthRepositoryImpl(authApi: authApi);

  AuthNotifier authProvider = AuthNotifier(
    firebaseAuth: firebaseAuth,
  );

  // Chat
  ChatApi chatApi = ChatApi(firestore, authProvider.user);
  ChatRepository chatRepository = ChatRepositoryImpl(chatApi);
  ChatUseCase chatUseCase = ChatUseCase(
    getChatDataUseCase: GetChatDataUseCase(chatRepository),
    sendMessageUseCase: SendMessageUseCase(chatRepository),
  );

  // Login
  LoginUseCase loginUseCase = LoginUseCase(
    emailSignInUseCase: EmailSignInUseCase(authRepository),
    emailSignUpUseCase: EmailSignUpUseCase(authRepository),
    googleSignInUseCase: GoogleSignInUseCase(authRepository),
  );

  // Profile
  ProfileUseCase profileUseCase = ProfileUseCase(
    singOutUseCase: SingOutUseCase(authRepository),
    profileImageUploadUseCase:
        ProfileImageUploadUseCase(authRepository, authProvider),
  );

  // ViewModel
  LoginScreenViewModel loginScreenViewModel =
      LoginScreenViewModel(loginUseCase);
  ChatViewModel chatViewModel = ChatViewModel(chatUseCase);
  ProfileViewModel profileViewModel = ProfileViewModel(profileUseCase);

  final RouteNotifier routeNotifier = RouteNotifier();
  return [
    ChangeNotifierProvider(create: (_) => authProvider),
    ChangeNotifierProvider(create: (_) => loginScreenViewModel),
    ChangeNotifierProvider(create: (_) => routeNotifier),
    ChangeNotifierProvider(create: (_) => chatViewModel),
    ChangeNotifierProvider(create: (_) => profileViewModel),
  ];
}
