import 'package:hive/hive.dart';

class TokenService {
  factory TokenService() => _instance;
  TokenService._internal();
  static final TokenService _instance = TokenService._internal();
  late final Box<String> _tokenBox;
  Future<void> initializePrefs() async {
    _tokenBox = Hive.box('tokenBox');
  }

  Future<bool> saveToken(String? token, bool remember) async {
    await _tokenBox.put(CacheManagerKey.token.toString(), token!);
    return true;
  }

  // Future<UserDetail?> getUserDetails(UserDetail user) async {
  //   return UserDetail(
  //       id: user.id, email: user.email, firstName: user.firstName);
  // }

  Future<String?>? getToken() async {
    return _tokenBox.get(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    await _tokenBox.delete(CacheManagerKey.token.toString());
    await _tokenBox.delete(CacheManagerKey.tempToken.toString());
  }
}

enum CacheManagerKey { token, tempToken, onBoard }
