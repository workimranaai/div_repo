import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  final SharedPreferences prefs;

  SharedPrefs(this.prefs);

  final String _fcmToken = 'fcmToken';

  final String _userId = 'userId';
  final String _isLoggedIn = 'isLoggedIn';
  final String _userName = 'userName';
  final String _email = 'email';
  final String _userType = "userType";

  Future<bool> prefsClear() async {
    return await prefs.clear();
  }



  void setFcmToken({required String fcmToken}) {
    prefs.setString(_fcmToken, fcmToken);
  }

  String? getFcmToken() {
    return prefs.getString(_fcmToken);
  }
  void setIsLoggedIn({required String isLoggedIn}) {
    prefs.setString(_isLoggedIn, isLoggedIn);
  }

  String? getIsLoggedIn() {
    return prefs.getString(_isLoggedIn);
  }


  void setUserId({required String userId}) {
    prefs.setString(_userId, userId);
  }

  String? getUserId() {
    return prefs.getString(_userId);
  }

  removeUserId() {
    prefs.remove(_userId);
  }

  void setUserName({required String userName}) {
    prefs.setString(_userName, userName);
  }

  String? getUserName() {
    return prefs.getString(_userName);
  }

  removeName() {
    prefs.remove(_userName);
  }

  void setEmail({required String email}) {
    prefs.setString(_email, email);
  }

  String? getEmail() {
    return prefs.getString(_email);
  }

  removeEmail() {
    prefs.remove(_email);
  }

  void setUserType({required String userType}) {
    prefs.setString(_userType, userType);
  }

  String? getUserType() {
    return prefs.getString(_userType);
  }

  removeUserType() {
    prefs.remove(_userType);
  }
}
