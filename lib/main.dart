import 'package:device_preview/device_preview.dart';
import 'package:financial_planning/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/onboarding_page.dart';

var showOnboardingPage = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  showOnboardingPage = prefs.getBool("showOnboardingPage");
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light().copyWith(
        platform: Theme.of(context).platform,
      ),
      debugShowCheckedModeBanner: false,
      title: _title,
      home: showOnboardingPage? OnboardingPage() : MainPage(),
      // home: IntroPage(
      //   onIntroEnd: (context) {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (context) {
      //           return MainPage();
      //         },
      //         fullscreenDialog: true
      //       )
      //     );
      //   }
      // )
    );
  }
}
