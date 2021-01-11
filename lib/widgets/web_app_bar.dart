import 'dart:ffi';

import 'package:financial_planning/services/launch_url.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar webAppBar(BuildContext context, WebViewController webViewController, String initialUrl) {
  return AppBar(
    automaticallyImplyLeading: true,
    backgroundColor: Color(0xff202B3B),
    centerTitle: true,
      title: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.transparent,),
        padding: EdgeInsets.all(8),
        height: AppBar().preferredSize.height - 8,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          splashColor: Colors.amber[800],
          highlightColor: Colors.amber[800],
          child: Image.asset(
            'assets/images/logo_white.png'
          ),
          onPressed: () {
            launchURL('https://grantprivate.com/');
          },
        ),
      ),
    // title: FlatButton(
    //   splashColor: Colors.amber[800],
    //   highlightColor: Colors.amber[800],
    //   child: Text(
    //     'Grant Private',
    //     style: TextStyle(
    //       fontWeight: FontWeight.w600,
    //       fontSize: 19,
    //       color: Colors.white
    //     ),
    //   ),
    //   onPressed: () {
    //     launchURL('https://grantprivate.com/');
    //   },
    // ),
    actions: [
      IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(
          CupertinoIcons.refresh,
          size: 25,
        ),
        splashColor: Colors.amber[800],
        highlightColor: Colors.amber[800],
        onPressed: () {
          webViewController.loadUrl(initialUrl);
        },
      ),
      IconButton(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        icon: Icon(
          CupertinoIcons.square_arrow_up,
          size: 25,
        ),
        splashColor: Colors.amber[800],
        highlightColor: Colors.amber[800],
        onPressed: () {
          launchURL(initialUrl);
        },
      ),
    ],
  );
}