import 'package:financial_planning/pages/about_page.dart';
import 'package:financial_planning/pages/collaborate_page.dart';
import 'package:financial_planning/pages/invest_page.dart';
import 'package:financial_planning/pages/plan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
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
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        allowImplicitScrolling: false,
        controller: _pageController,
        children: <Widget>[
          PlanPage(
            initialUrl: 'https://www.moneyguidepro.com/ifa/Guests.aspx?gst=3E308993DF970813397C7D537715510F80511CEB82C9D79F4AFB75FCEC9CB579',
          ),
          InvestPage(
            initialUrl: 'https://intelligent-client.schwab.com/iip/#/getStarted'
          ),
          AboutPage(
            initialUrl: 'https://grantprivate.com/who-we-are/'
          ),
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
        selectedIconTheme: IconThemeData(size: 28),
        unselectedIconTheme: IconThemeData(size: 28),
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        selectedFontSize: 17,
        unselectedFontSize: 17,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}

// return WebView(
//     initialUrl: 'https://docs.google.com/forms/d/e/1FAIpQLSetM1VcMZhZrwEhMdr74ZvDP3qdhRpLg7R-AN8DrrnpUXmDcA/viewform',
//     javascriptMode: JavascriptMode.unrestricted,
//   );
// }),
