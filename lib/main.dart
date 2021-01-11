import 'package:financial_planning/pages/intro_page.dart';
import 'package:financial_planning/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        platform: Theme.of(context).platform,
      ),
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MainPage(),
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
