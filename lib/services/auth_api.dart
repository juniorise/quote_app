import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quote_app/constant/api_constant.dart';
import 'package:quote_app/models/mixins/api_mixin.dart';

class AuthApi with ApiMixin {
  /// This function doesn't return any things.
  /// To check if success or not,
  /// use this `authApi.success()`
  ///
  /// To get message either it is error or success,
  /// use this:`authApi.message()`
  Future<void> logIntoAccount({
    required String username,
    required String password,
  }) async {
    // reset response
    this.responseBody = null;

    final endpoint = ApiConstant.baseUrl + "/authentication.php";
    final body = {
      "username": username,
      "password": password,
      "create_on": DateTime.now().millisecondsSinceEpoch.toString()
    };

    final result = await http.post(Uri.parse(endpoint), body: body);
    this.responseBody = jsonDecode(result.body.toString());
  }
}
