mixin ApiMixin {
  Map<dynamic, dynamic>? responseBody;

  success() {
    if (this.responseBody != null) {
      int status = this.responseBody?['status'];
      return status >= 200 && status < 300;
    }
    return false;
  }

  String? message() {
    if (responseBody != null && responseBody?.containsKey("message") == true) {
      return responseBody?['message'];
    } else {
      return null;
    }
  }
}
