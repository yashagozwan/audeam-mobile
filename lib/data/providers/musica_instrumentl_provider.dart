import 'package:audeam_mobile/core/services/firebase_service.dart';
import 'package:audeam_mobile/data/interfaces/musical_instrument.dart';
import 'package:audeam_mobile/data/models/musical_instrument_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MusicalInstrumentProvider implements MusicalInstrument {
  final _firebaseService = FirebaseService.instance;

  CollectionReference<Map<String, dynamic>> get _musicalInstrument {
    return _firebaseService.firestore.collection('musical_instruments');
  }

  @override
  Future<MusicalInstrumentModel?> findOne(String query) async {
    try {
      final results =
          await _musicalInstrument.where('title', isEqualTo: query).get();

      final musicals = results.docs.map((e) {
        print(e.id);
        return MusicalInstrumentModel.fromJson(e.data());
      });

      return musicals.isEmpty ? null : musicals.first;
    } on FirebaseException {
      return null;
    }
  }
}
