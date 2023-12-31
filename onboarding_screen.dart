import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/models.dart';

class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        name: FooderlichPages.onboardingPath,
        key: ValueKey(FooderlichPages.onboardingPath),
        child: const OnboardingScreen());
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 35, 38),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            'Getting Started',
            style: TextStyle(
              color: Color.fromARGB(255, 251, 254, 251),
            ),
          ),
          leading: GestureDetector(
            child: const Icon(
              Icons.chevron_left,
              size: 35,
              color: Color.fromARGB(255, 243, 246, 243),
            ),
            onTap: () {
              Navigator.pop(context, true);
            },
          )),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: buildPages()),
            buildIndicator(),
            buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text(
            'Skip',
            style: TextStyle(
              color: Color.fromARGB(255, 243, 246, 243),
            ),
          ),
          onPressed: () {
            Provider.of<AppStateManager>(context, listen: false).onboarded();
          },
        )
      ],
    );
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onboardPageView(
          const AssetImage('assets/fooderlich_assets/promo1.png'),
          'Promo Deals!',
          textStyle: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 8, 8, 8), // Set the desired text color
          ),
        ),
        onboardPageView(
          const AssetImage('assets/fooderlich_assets/promo2.png'),
          'Promo Deals!',
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white, // Set the desired text color
          ),
        ),
        onboardPageView(
          const AssetImage('assets/fooderlich_assets/promo3.png'),
          'Promo Deals!',
          textStyle: TextStyle(
            fontSize: 20,
            color: Colors.white, // Set the desired text color
          ),
        ),
      ],
    );
  }

  Widget onboardPageView(
    ImageProvider imageProvider,
    String text, {
    TextStyle? textStyle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            text,
            style: textStyle ?? TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(activeDotColor: rwColor),
    );
  }
}
