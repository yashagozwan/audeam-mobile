import 'package:audeam_mobile/core/constants/constants.dart';
import 'package:audeam_mobile/data/models/models.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Firestore Test', () {
    late final FakeFirebaseFirestore firestore;

    setUpAll(() {
      firestore = FakeFirebaseFirestore();
    });

    test('Mock', () async {
      final collection =
          firestore.collection(StringResources.musicalInstrument);

      const instrument = MusicalInstrument(
        name: 'Guitar',
        description: 'This cool',
        image: 'image',
      );

      const instrument2 = MusicalInstrument(
        name: 'Piano',
        description: 'This cool',
        image: 'image',
      );

      final map = instrument.toJson();
      map.remove('id');

      final map2 = instrument2.toJson();
      map2.remove('id');

      await collection.add(map);
      await collection.add(map2);

      final snapshot = await collection.get();

      final instruments = snapshot.docs.map((e) {
        final instrument = MusicalInstrument.fromJson(e.data());
        return instrument.copyWith(id: e.id);
      });

      instruments.forEach((e) {
        print(e);
      });
    });
  });
}
