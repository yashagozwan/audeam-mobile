import 'package:audeam_mobile/app.dart';
import 'package:audeam_mobile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

void main() async {
  _firebaseConfig();
  runApp(const App());
}
