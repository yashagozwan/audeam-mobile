import 'package:audeam_mobile/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static FirebaseService? _firebaseService;

  FirebaseService._();

  static final FirebaseService instance =
      _firebaseService ??= FirebaseService._();

  final firestore = FirebaseFirestore.instance;

  Future<void> configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  CollectionReference<Map<String, dynamic>> musicalInstrument() {
    return firestore.collection('musical_instrument');
  }
}
