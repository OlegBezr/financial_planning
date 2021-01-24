import 'package:financial_planning/models/video_card_info.dart';
import 'package:financial_planning/pages/plan_page.dart';
import 'package:financial_planning/widgets/register_login_dialog.dart';
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
            buttonText: 'Start Financial Planning',
            onClick: (BuildContext context) {
              showRegisterLoginDialog(
                context,
                PlanPage(
                  initialUrl: 'https://www.moneyguidepro.com/ifa/selfregister/investorregistration?gst=3E308993DF970813397C7D537715510F80511CEB82C9D79F4AFB75FCEC9CB579'
                ), 
                PlanPage(
                  initialUrl: 'https://www.moneyguidepro.com/first-affirmative/Guests.aspx?gst=&sDestPage=10032'
                )
              );
            },
            // onClick: (BuildContext context) {
            //   Navigator.of(context).push(
            //     MaterialPageRoute(
            //       builder: (context) {
            //         return PlanPage(
            //           initialUrl: 'https://www.moneyguidepro.com/ifa/Guests.aspx?gst=3E308993DF970813397C7D537715510F80511CEB82C9D79F4AFB75FCEC9CB579',
            //         );
            //       },
            //       fullscreenDialog: true
            //     )
            //   );
            // },
          ),
          VideoPage(
            videos: [
              VideoCardInfo(
                videoSign: 'More About Investing',
                videoAsset: 'assets/videos/invest.mp4',
                videoUrl: 'https://vimeo.com/457959140',
              ),
              VideoCardInfo(
                videoSign: 'Science of Investing',
                videoAsset: 'assets/videos/science_investing.mp4',
                videoUrl: 'https://www.mydimensional.com/videoframe/1919/applying-science-to-investing',
              ),
              VideoCardInfo(
                videoSign: 'Dimensional Origins',
                videoAsset: 'assets/videos/dimensional_origins.mp4',
                videoUrl: 'https://www.mydimensional.com/videoframe/1921/dimensional-origins',
              ),
              VideoCardInfo(
                videoSign: 'Work at Dimensional',
                videoAsset: 'assets/videos/dimensional_work.mp4',
                videoUrl: 'https://www.mydimensional.com/videoframe/3735/working-at-dimensional',
              ),
              VideoCardInfo(
                videoSign: 'Missing Days',
                videoAsset: 'assets/videos/best_days.mp4',
                videoUrl: 'https://videos.dimensional.com/video?v=1_ip614rq2&p=b10a130d-eaed-4b90-a69a-882bf2c3cf15&f=&d=false',
              )
            ],
            buttonText: 'Start Investing',
            onClick: (BuildContext context) {
              showRegisterLoginDialog(
                context,
                InvestPage(
                  initialUrl: 'https://intelligent-client.schwab.com/iip/#/getStarted',
                ), 
                PlanPage(
                  initialUrl: 'https://intelligent-client.schwab.com/iip/#/login'
                )
              );
            },
            // nextPage: InvestPage(
            //   initialUrl: 'https://intelligent-client.schwab.com/iip/#/getStarted'
            // ),
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
            onClick: (BuildContext context) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return AboutPage(
                      initialUrl: 'https://grantprivate.com/who-we-are/'
                    );
                  },
                  fullscreenDialog: true
                )
              );
            },
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