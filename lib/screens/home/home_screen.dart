import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quote_app/screens/home/upload_sheet.dart';

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
          PageView(
            controller: pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (int index) {
              setState(() => imageIndex = index % (images.length - 1));
            },
            children: [
              buildQuote(context),
              buildQuote(context),
              buildQuote(context),
              buildQuote(context),
              buildQuote(context),
            ],
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
            context: context,
            builder: (context) {
              return UploadQuoteSheet();
            },
          );
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

  Widget buildQuote(BuildContext context) {
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
                      "Don't let what you cannot do interfere with what you can do.",
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "– John Wooden –",
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
