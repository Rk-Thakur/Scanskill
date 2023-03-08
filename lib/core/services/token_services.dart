import 'package:hive/hive.dart';

class TokenService {
  factory TokenService() => _instance;
  TokenService._internal();
  static final TokenService _instance = TokenService._internal();
  late final Box<String> _tokenBox;
  late final Box<bool> _onBoardBox;
  Future<void> initializePrefs() async {
    _tokenBox = Hive.box('tokenBox');
    _onBoardBox = Hive.box('onBoardBox');
  }

  Future<bool> saveToken(String? token, bool remember) async {
    await _tokenBox.put(CacheManagerKey.token.toString(), token!);
    return true;
  }

  // Future<UserDetail?> getUserDetails(UserDetail user) async {
  //   return UserDetail(
  //       id: user.id, email: user.email, firstName: user.firstName);
  // }
  Future<bool> saveOnboard() async {
    await _onBoardBox.put(CacheManagerKey.onBoard.toString(), true);
    return true;
  }

  Future<bool?>? getOnBoard() async {
    return _onBoardBox.get(CacheManagerKey.onBoard.toString());
  }

  String? getToken() {
    return _tokenBox.get(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    await _tokenBox.delete(CacheManagerKey.token.toString());
    await _tokenBox.delete(CacheManagerKey.tempToken.toString());
  }
}

enum CacheManagerKey { token, tempToken, onBoard }
