import 'package:audeam_mobile/core/services/firebase_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firebase Serivice', () {
    test('checking singleton', () {
      expect(FirebaseService.instance, FirebaseService.instance);
    });
  });
}
