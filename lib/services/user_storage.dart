import 'package:shared_preferences/shared_preferences.dart';

class UserStorage {
  static Future<void> setUser(String? username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    await prefs.setString('user', username??"");
  }
  static Future<String?> getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
  
}