import 'package:flutter/material.dart';
import 'package:quote_app/services/quote_api.dart';
import 'package:quote_app/services/user_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UploadQuoteSheet extends StatefulWidget {
  const UploadQuoteSheet({Key? key}) : super(key: key);

  @override
  _UploadQuoteSheetState createState() => _UploadQuoteSheetState();
}

class _UploadQuoteSheetState extends State<UploadQuoteSheet> {
  String? error;
  late String username;

  final authorController = TextEditingController();
  final quoteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 4),
            width: 60,
            height: 6,
            decoration: BoxDecoration(
              color: Color(0xFFC4C4C4),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              padding: EdgeInsets.only(
                top: 16,
                right: 16,
                bottom: 18,
                left: 16,
              ),
              height: 465,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 14, right: 14),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: authorController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Author name...',
                          hintStyle: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 303,
                      padding: EdgeInsets.only(
                          top: 8, bottom: 8, left: 14, right: 14),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: quoteController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type any quote here...',
                          hintStyle: TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () async {
                        await UserStorage.getUser().then((value) {
                          if (value != null) {
                            username = value;
                          }
                        });

                        if (authorController.text.length == 0) {
                          error = "Author field must be filled";
                        } else if (quoteController.text.length <= 10) {
                          error = "Quote text must be longer than 10 letters";
                        } else {
                          error = null;
                          QuoteApi api = QuoteApi();
                          await api.createQuote(
                              quote: quoteController.text,
                              author: authorController.text,
                              username: username);
                          if (api.success()) {
                            Navigator.of(context).pop();
                            showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message:
                                  "Upload Successful",
                            ),   
                          );
                          } else {
                            error = api.message();
                          }
                        }
                        if (error != null) {
                          Navigator.of(context).pop();
                          showTopSnackBar(
                            context,
                            CustomSnackBar.error(
                              message:
                                  "${error ?? ""}",
                            ),   
                          );
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 137, vertical: 14),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Upload',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
