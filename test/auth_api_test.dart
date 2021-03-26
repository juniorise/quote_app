import 'package:flutter_test/flutter_test.dart';
import 'package:quote_app/services/auth_api.dart';

void main() {
  group("AuthApi.signIn", () {
    test("", () async {
      AuthApi authApi = AuthApi();
      await authApi.logIntoAccount(username: "panha", password: "d");

      if (authApi.success()) {
        print("Successfully");
      } else {
        print("Fail");
      }
      print(authApi.message());
    });
  });
}
