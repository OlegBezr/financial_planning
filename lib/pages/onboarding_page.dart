import 'package:financial_planning/pages/main_page.dart';
import 'package:financial_planning/widgets/page_view_dots.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var _activePage = 0;
  var _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    _activePage = index;
                  });
                },
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              'assets/images/logo_color.png'
                            ),
                          ),
                          Text(
                            'Welcome on board!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          SizedBox(
                            height: 10
                          ),
                          Text(
                            'Your financial well being is \nour first priority.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Through this app you will learn more about free financial services offered by Grant Private partners.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                          child: Text(
                            'License Agreement',
                            style: TextStyle(
                              fontSize: 24
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 15,
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                'CA Insurance Lic. #OH71920  •  CFP® CERTIFIED FINANCIAL PLANNER™\n\n' +
                                'All written content on this site is for information purposes only. ' +
                                'Opinions expressed herein are solely those of Grant Private Wealth Management Inc. ' + 
                                'and our editorial staff. Material presented is believed to be from reliable sources; ' + 
                                'however, we make no representations as to its accuracy or completeness. ' +
                                'All information and ideas should be discussed in detail with your individual adviser prior to implementation. ' +
                                'Advisory services are offered by Grant Private Wealth Management Inc. ' +
                                'a Registered Investment Advisor in the State of California. ' +
                                'Insurance products and services are offered through Ohio National, an affiliated company. ' +
                                'Grant Private Wealth Management Inc. and Ohio National are not affiliated with ' +
                                'or endorsed by the Social Security Administration or any government agency, ' +
                                'and are not engaged in the practice of law.\n\n' +
                                'The presence of this web site shall in no way be construed or interpreted as a solicitation ' +
                                'to sell or offer to sell advisory services to any residents of any State other than ' +
                                'the State of California or where otherwise legally permitted. ' +
                                'You should always consult an attorney or tax professional regarding your specific legal or tax situation.\n\n' +
                                'Images and photographs are included for the sole purpose of visually enhancing the website. ' +
                                'None of them are photographs of current or former clients. ' +
                                'They should not be construed as an endorsement or testimonial from any of the persons in the photograph.'
                              )
                            ),
                          ),
                        ),
                        FlatButton(
                          color: Color(0xff202B3B),
                          // padding: EdgeInsets.all(10),
                          splashColor: Colors.amber[800],
                          highlightColor: Colors.amber[800],
                          child: const Text(
                            "Accept the license",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () async {
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
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                  )
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    )
                  ] + buildDots(context, _activePage, 2) + <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      child: _activePage != 1 ? FlatButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease
                          );
                        },
                        splashColor: Colors.amber[800],
                        highlightColor: Colors.amber[800],
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Color(0xff202B3B),
                          ),
                        ),
                      ): null,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}