import 'package:flutter_test/flutter_test.dart';
import 'package:quote_app/services/quote_api.dart';

void main() {
  QuoteApi quoteApi = QuoteApi();
  group("QuoteApi.fetchAll", () {
    test("", () async {
      final result = await quoteApi.fetchAll();
      result.users?.forEach((element) {
        print(element.toString());
      });
    });
  });

  group("QuoteApi.createQuote", () {
    test("", () async {
      await quoteApi.createQuote(
        author: "Panha",
        quote: "Programmer has no life",
        username: "panha",
      );

      if (quoteApi.success()) {
        print("Success++");
      }

      print(quoteApi.message());
    });
  });
}
