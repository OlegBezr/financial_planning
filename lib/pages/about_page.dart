import 'package:financial_planning/services/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class AboutPage extends StatefulWidget {
  AboutPage({this.initialUrl});

  final String initialUrl;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202B3B),
        title: FlatButton(
          child: Text(
            'Grant Private',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: Colors.white,
            ),
          ),
          splashColor: Colors.amber[800],
          highlightColor: Colors.amber[800],
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
                _webViewController.loadUrl(widget.initialUrl);
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
                launchURL(widget.initialUrl);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: WebView(
          onWebViewCreated: (webViewController) {
            _webViewController = webViewController;
          },
          initialUrl: widget.initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
        )
      )
    );
  }
}