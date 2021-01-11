// import 'package:financial_planning/pages/about_page.dart';
// import 'package:financial_planning/widgets/video_page.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';

// class IntroPage extends StatefulWidget {
//   IntroPage({this.onIntroEnd});
//   final Function onIntroEnd;

//   @override
//   _IntroPageState createState() => _IntroPageState();
// }

// class _IntroPageState extends State<IntroPage> {
//   List<Slide> slides = new List();

//   Function goToTab;

//   @override
//   void initState() {
//     super.initState();

//     slides.add(
//       new Slide(
//         title: "SCHOOL",
//         styleTitle:
//             TextStyle(color: Color(0xff3da4ab), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//         description:
//             "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.",
//         styleDescription:
//             TextStyle(color: Color(0xfffe9c8f), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//         pathImage: "images/photo_school.png",
//       ),
//     );
//     // slides.add(
//     //   new Slide(
//     //     title: "MUSEUM",
//     //     styleTitle:
//     //         TextStyle(color: Color(0xff3da4ab), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//     //     description: "Ye indulgence unreserved connection alteration appearance",
//     //     styleDescription:
//     //         TextStyle(color: Color(0xfffe9c8f), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//     //     pathImage: "images/photo_museum.png",
//     //   ),
//     // );
//     // slides.add(
//     //   new Slide(
//     //     title: "COFFEE SHOP",
//     //     styleTitle:
//     //         TextStyle(color: Color(0xff3da4ab), fontSize: 30.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
//     //     description:
//     //         "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//     //     styleDescription:
//     //         TextStyle(color: Color(0xfffe9c8f), fontSize: 20.0, fontStyle: FontStyle.italic, fontFamily: 'Raleway'),
//     //     pathImage: "images/photo_coffee_shop.png",
//     //   ),
//     // );
//   }

//   void onDonePress() {
//     // Back to the first tab
//     this.goToTab(0);
//   }

//   void onTabChangeCompleted(index) {
//     // Index of current tab is focused
//   }

//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
//       color: Color(0xffffcc5c),
//       size: 35.0,
//     );
//   }

//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
//       color: Color(0xffffcc5c),
//     );
//   }

//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
//       color: Color(0xffffcc5c),
//     );
//   }

//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = new List();
//     tabs.add(
//       VideoPage(
//         videoSign: 'About Us',
//         videoAsset: 'assets/videos/about.mp4',
//         videoUrl: 'https://vimeo.com/470751400',
//         buttonText: 'Learn more',
//         nextPage: AboutPage(
//           initialUrl: 'https://grantprivate.com/who-we-are/'
//         ),
//       ),
//     );
//     return tabs;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//           child: new IntroSlider(
//         // List slides
//         slides: this.slides,

//         // Skip button
//         renderSkipBtn: this.renderSkipBtn(),
//         colorSkipBtn: Color(0x33ffcc5c),
//         highlightColorSkipBtn: Color(0xffffcc5c),

//         // Next button
//         renderNextBtn: this.renderNextBtn(),

//         // Done button
//         renderDoneBtn: this.renderDoneBtn(),
//         onDonePress: this.onDonePress,
//         colorDoneBtn: Color(0x33ffcc5c),
//         highlightColorDoneBtn: Color(0xffffcc5c),

//         // Dot indicator
//         colorDot: Color(0xffffcc5c),
//         sizeDot: 13.0,
//         // typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

//         // Tabs
//         listCustomTabs: this.renderListCustomTabs(),
//         backgroundColorAllSlides: Colors.white,
//         refFuncGoToTab: (refFunc) {
//           this.goToTab = refFunc;
//         },

//         // Show or hide status bar
//         shouldHideStatusBar: true,

//         // On tab change completed
//         onTabChangeCompleted: this.onTabChangeCompleted,
//       ),
//     );
//   }
// }

// // Write something to storage not to show intro_page? 
// // Show intro page every time?