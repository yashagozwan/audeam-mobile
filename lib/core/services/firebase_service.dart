import 'package:audeam_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static FirebaseService? _firebaseService;

  FirebaseService._();

  static final FirebaseService instance =
      _firebaseService ??= FirebaseService._();

  Future<void> configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.android,
    );
  }
}
