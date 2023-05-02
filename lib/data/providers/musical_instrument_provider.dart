import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MusicalInstrumentProvider {
  static final firestore = FirebaseFirestore.instance;
  static final collection =
      firestore.collection(StringResources.musicalInstrument);

  Future<void> insertOne(MusicalInstrument instrument) async {
    try {
      final result = await collection.add(instrument.toJson());
    } on FirebaseFirestore {
      rethrow;
    }
  }

  Future<Iterable<MusicalInstrument>> findAll() async {
    final instruments = await collection.get();

    return instruments.docs.map((e) {
      final instrument = MusicalInstrument.fromJson(e.data());
      return instrument.copyWith(id: e.id);
    });
  }
}
