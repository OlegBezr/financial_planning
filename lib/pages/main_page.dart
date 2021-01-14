import 'package:financial_planning/models/video_card_info.dart';
import 'package:financial_planning/pages/plan_page.dart';
import 'package:financial_planning/widgets/video_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about_page.dart';
import 'collaborate_page.dart';
import 'invest_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  var _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    var tabIconSize = MediaQuery.of(context).size.width / 12.5;

    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        controller: _pageController,
        children: <Widget>[
          VideoPage(
            videos: [
              VideoCardInfo(
                videoSign: 'Financial Planning',
                videoAsset: 'assets/videos/plan.mp4',
                videoUrl: 'https://vimeo.com/426111911',
              ),
              VideoCardInfo(
                videoSign: 'About MyBlocks',
                videoAsset: 'assets/videos/myblocks.mp4',
                videoUrl: 'https://vimeo.com/391562736',
              ),
              VideoCardInfo(
                videoSign: 'Financial Freedom',
                videoAsset: 'assets/videos/freedom.mp4',
                videoUrl: 'https://vimeo.com/362370392',
              )
            ],
            buttonText: 'Start financial planning',
            nextPage: PlanPage(
              initialUrl: 'https://www.moneyguidepro.com/ifa/Guests.aspx?gst=3E308993DF970813397C7D537715510F80511CEB82C9D79F4AFB75FCEC9CB579',
            ),
          ),
          VideoPage(
            videos: [
              VideoCardInfo(
                videoSign: 'Watch to learn more',
                videoAsset: 'assets/videos/invest.mp4',
                videoUrl: 'https://vimeo.com/457959140',
              )
            ],
            buttonText: 'Start Investing',
            nextPage: InvestPage(
              initialUrl: 'https://intelligent-client.schwab.com/iip/#/getStarted'
            ),
          ),
          VideoPage(
            videos: [
              VideoCardInfo(
                videoSign: 'About Us',
                videoAsset: 'assets/videos/about.mp4',
                videoUrl: 'https://vimeo.com/470751400',
              )
            ],
            buttonText: 'Learn more',
            nextPage: AboutPage(
              initialUrl: 'https://grantprivate.com/who-we-are/'
            ),
          ),
          // VideoPage(
          //   videos: [
          //     VideoCardInfo(
          //       videoSign: 'Watch to learn more',
          //       videoAsset: 'assets/videos/about.mp4',
          //       videoUrl: 'https://vimeo.com/470751400',
          //     )
          //   ],
          //   buttonText: 'Schedule a meeting',
          //   nextPage: CollaboratePage(
          //     initialUrl: 'https://calendly.com/grantprivate/1-hour-zoom-meeting-clone?month=2020-12'
          //   ),
          // ),
          CollaboratePage(
            initialUrl: 'https://calendly.com/grantprivate/1-hour-zoom-meeting-clone?month=2020-12'
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.briefcase),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.money_dollar_circle),
            label: 'Invest',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info_circle),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'Collaborate',
          ),
        ],
        backgroundColor: Color(0xff202B3B),
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(size: tabIconSize),
        unselectedIconTheme: IconThemeData(size: tabIconSize),
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}