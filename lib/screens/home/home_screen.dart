import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_app/models/quote/quote_list_model.dart';
import 'package:quote_app/models/quote/quote_model.dart';
import 'package:quote_app/screens/home/upload_sheet.dart';
import 'package:quote_app/services/quote_api.dart';

List<String> images = [
  "https://miro.medium.com/max/8576/0*zBu6EBAwjXXXHz-z",
  "https://wallpaperaccess.com/full/501978.jpg",
  "https://thenationpress.net/en/imgs/2021/02/1612549734blobid1.jpg",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? pageController;
  final ValueNotifier<double> animationNotifier = ValueNotifier<double>(0);
  int imageIndex = 0;

  @override
  void initState() {
    pageController = PageController();
    listener();
    super.initState();
  }

  listener() {
    pageController?.addListener(() {
      final animation = pageController!.page! % 1;
      animationNotifier.value = animation;
    });
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          FutureBuilder(
            future: QuoteApi().fetchAll(),
            builder: (context, snapshot) {
              List<QuoteModel> users = [];

              if (snapshot.hasData) {
                users = (snapshot.data as QuoteListModel).users ?? [];
              }

              return AnimatedOpacity(
                opacity: snapshot.hasData ? 1 : 0,
                duration: const Duration(milliseconds: 350),
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (int index) {
                    setState(() => imageIndex = index % (images.length - 1));
                  },
                  children: List.generate(
                    users.length,
                    (index) {
                      int _index = users.length - 1 - index;
                      return buildQuote(
                        context: context,
                        quote: users[_index].quote ?? "",
                        authur: users[_index].author ?? "",
                      );
                    },
                  ),
                ),
              );
            },
          ),
          buildPageIndicator(statusBarHeight),
          buildAddQuoteButton(statusBarHeight, context),
        ],
      ),
    );
  }

  Positioned buildAddQuoteButton(double statusBarHeight, BuildContext context) {
    return Positioned(
      bottom: statusBarHeight,
      left: 24,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            context: context,
            builder: (context) {
              return UploadQuoteSheet();
            },
          ).then((success) {
            print("$success");
            if (success == true) {
              setState(() {});
            }
          });
        },
        child: Row(
          children: [
            Container(
              height: 48.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Theme.of(context).colorScheme.background,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Add"),
                  const SizedBox(width: 4.0),
                  const Icon(Icons.add, color: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Positioned buildPageIndicator(double statusBarHeight) {
    return Positioned(
      bottom: statusBarHeight + 24,
      left: 0,
      right: 0,
      child: ValueListenableBuilder(
        valueListenable: animationNotifier,
        builder: (context, value, child) {
          final width1 = lerpDouble(4.0, 16.0, animationNotifier.value);
          final width2 = lerpDouble(16.0, 4.0, animationNotifier.value);
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                height: 4.0,
                color: Colors.white,
                duration: Duration(milliseconds: 150),
                width: pageController?.page?.toInt().isEven == true
                    ? width1
                    : width2,
              ),
              const SizedBox(width: 4.0),
              AnimatedContainer(
                height: 4.0,
                color: Colors.white,
                duration: Duration(milliseconds: 150),
                width: pageController?.page?.toInt().isOdd == true
                    ? width1
                    : width2,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildQuote({
    required BuildContext context,
    required String quote,
    required String authur,
  }) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: animationNotifier,
          child: FadeInImage.assetNetwork(
            placeholder: "assets/blur.jpg",
            image: images[imageIndex],
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 500),
            fadeOutDuration: Duration(milliseconds: 500),
          ),
          builder: (context, value, child) {
            double opacity = 0;
            double height = MediaQuery.of(context).size.height;

            if (animationNotifier.value <= 0.5) {
              opacity = 0.5 - animationNotifier.value;
            } else {
              opacity = animationNotifier.value - 0.5;
            }

            if (opacity > 1) opacity = 1;
            if (opacity < 0) opacity = 0;

            final Matrix4 transform = Matrix4.identity()
              ..translate(0.0, height * animationNotifier.value);

            return Opacity(
              opacity: opacity,
              child: Container(
                transform: transform,
                child: child,
              ),
            );
          },
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            constraints: const BoxConstraints(maxWidth: 300),
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()..translate(-32.0, -8.0),
                  child: Icon(
                    FontAwesomeIcons.quoteLeft,
                    color: Colors.white.withOpacity(0.3),
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      "$quote",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "– $authur –",
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
