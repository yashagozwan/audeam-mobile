import 'package:shared_preferences/shared_preferences.dart';

class SharedProvider {
  final userId = 'userId';

  final _shared = SharedPreferences.getInstance();

  Future<void> saveUserId(String userId) async {
    final shared = await _shared;
    shared.setString(this.userId, userId);
  }
}
