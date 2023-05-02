import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('SharedPreferences', () {
    late final SharedPreferences shared;

    setUpAll(() async {
      SharedPreferences.setMockInitialValues({});
      shared = await SharedPreferences.getInstance();
    });

    test('test', () async {
      const key = 'id';
      const value = 'abc';

      final result = await shared.setString(key, value);
      expect(result, true);

      final getValue = shared.getString(key);
      expect(getValue, value);
    });
  });
}
