import 'package:quote_app/models/quote/quote_model.dart';

class QuoteListModel {
  QuoteListModel({this.users});
  List<QuoteModel>? users;

  factory QuoteListModel.fromJson(Map<String, dynamic> json) {
    return QuoteListModel(
      users: List<QuoteModel>.from(
        json["users"].map(
          (x) => QuoteModel.fromJson(x),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "users": List<dynamic>.from(
        (users ?? []).map((x) => x.toJson()),
      )
    };
  }
}
