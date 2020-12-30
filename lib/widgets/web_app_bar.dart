import 'package:financial_planning/services/launch_url.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar webAppBar(WebViewController webViewController, String initialUrl) {
  return AppBar(
    backgroundColor: Color(0xff202B3B),
    title: FlatButton(
      splashColor: Colors.amber[800],
      highlightColor: Colors.amber[800],
      child: Text(
        'Grant Private',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: Colors.white
        ),
      ),
      onPressed: () {
        launchURL('https://grantprivate.com/');
      },
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        child: IconButton(
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
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: IconButton(
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
      ),
    ],
  );
}