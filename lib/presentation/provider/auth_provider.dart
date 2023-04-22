import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  create: (_) => FirebaseAuth.instance,
);
