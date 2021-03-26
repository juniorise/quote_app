class QuoteModel {
  QuoteModel({
    this.id,
    this.quote,
    this.author,
    this.uploadBy,
    this.publishedOn,
  });

  String? id;
  String? quote;
  String? author;
  String? uploadBy;
  DateTime? publishedOn;

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    // convert from string to int
    final int? result = json.containsKey("published_on") == true
        ? int.tryParse(json['published_on'].toString())
        : null;

    // convert from int to DateTime object
    final DateTime? publishedOn =
        result != null ? DateTime.fromMillisecondsSinceEpoch(result) : null;

    return QuoteModel(
      id: json["id"],
      quote: json["quote"] == null ? null : json["quote"],
      author: json["author"] == null ? null : json["author"],
      uploadBy: json["upload_by"] == null ? null : json["upload_by"],
      publishedOn: publishedOn,
    );
  }

  Map<String, dynamic> toJson() {
    final _publishedOn = publishedOn == null
        ? null
        : publishedOn?.millisecondsSinceEpoch.toString();
    return {
      "id": id,
      "quote": quote == null ? null : quote,
      "author": author == null ? null : author,
      "upload_by": uploadBy == null ? null : uploadBy,
      "published_on": _publishedOn,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
