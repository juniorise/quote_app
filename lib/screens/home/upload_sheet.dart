import 'package:flutter/material.dart';

class UploadQuoteSheet extends StatefulWidget {
  const UploadQuoteSheet({Key? key}) : super(key: key);

  @override
  _UploadQuoteSheetState createState() => _UploadQuoteSheetState();
}

class _UploadQuoteSheetState extends State<UploadQuoteSheet> {
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
                    GestureDetector(
                      onTap: () {
                        print(authorController.text);
                        print(quoteController.text);
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 137, vertical: 14),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Upload',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
