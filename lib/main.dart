// flutter
import 'package:flutter/material.dart';

// packages
import 'package:firebase_core/firebase_core.dart';

// firebase option
import 'package:flutter_chat_app_clone/firebase_options.dart';
import 'package:flutter_chat_app_clone/global/route/route_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// widget
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, snapshot) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: const Color(0xffe78111),
              scaffoldBackgroundColor: Colors.grey.shade800,
              useMaterial3: true,
            ),
            routerConfig: router,
          );
        });
  }
}
