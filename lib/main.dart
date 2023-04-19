import 'package:audeam_mobile/app.dart';
import 'package:audeam_mobile/core/services/firebase_service.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseConfig() async {
  await FirebaseService.instance.configure();
}

void main() {
  _firebaseConfig();
  runApp(const App());
}
