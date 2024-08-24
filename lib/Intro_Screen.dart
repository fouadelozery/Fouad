import 'package:flutter/material.dart';

import 'package:flutterf/LoginScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pagees = [
    PageViewModel(
      title: "Hello!",
      body: "Welcome In Our Shop App",
      decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
      image: Center(
        child: Image.asset('assets1/1.png'),
      ),
    ),
    PageViewModel(
      title: "What Ever you Need",
      body: "All Products In One Place ",
      decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      image: Center(
        child: Image.asset('assets1/2.png'),
      ),
    ),
    PageViewModel(
      title: "Start Your Shopping",
      body: "Enjoy !",
      decoration: const PageDecoration(
          titleTextStyle:
              TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
      image: Center(
        child: Image.asset('assets1/3.png'),
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: IntroductionScreen(
          pages: pagees,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            "Done ",
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            "Skip ",
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
