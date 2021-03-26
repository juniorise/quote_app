import 'dart:convert';
import 'package:quote_app/constant/api_constant.dart';
import 'package:quote_app/models/mixins/api_mixin.dart';
import 'package:quote_app/models/quote/quote_list_model.dart';
import 'package:http/http.dart' as http;

class QuoteApi with ApiMixin {
  Future<QuoteListModel> fetchAll() async {
    final endpoint = ApiConstant.baseUrl + "/get_quote.php";
    final result = await http.get(Uri.parse(endpoint));
    final json = jsonDecode(result.body.toString());
    return QuoteListModel.fromJson(json);
  }

  /// This function doesn't return any things.
  /// To check if success or not,
  /// use this `quoteApi.success()`
  ///
  /// To get message either it is error or success,
  /// use this:`quoteApi.message()`
  Future<void> createQuote({
    required String quote,
    required String author,
    required String username,
  }) async {
    final endpoint = ApiConstant.baseUrl + "/create_quote.php";

    final body = {
      "quote": quote,
      'author': author,
      'username': username,
      "date": DateTime.now().millisecondsSinceEpoch.toString(),
    };

    final result = await http.post(Uri.parse(endpoint), body: body);
    this.responseBody = jsonDecode(result.body);
  }
}
