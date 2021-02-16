import 'package:financial_planning/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Title of first page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on "),
              Icon(Icons.edit),
              Text(" to edit a post"),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        ),
        PageViewModel(
          title: "Title of second page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on "),
              Icon(Icons.edit),
              Text(" to edit a post"),
            ],
          ),
          image: const Center(child: Icon(Icons.android)),
        ),
      ],
      done: const Text(
        "Accept the license",
        style: TextStyle(fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
      onDone: () async {
        var prefs = await SharedPreferences.getInstance();
        await prefs.setBool("showOnboardingPage", false);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return MainPage();
            }
          )
        );
      },
    );
  }
}