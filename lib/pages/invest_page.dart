import 'package:financial_planning/services/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class InvestPage extends StatefulWidget {
  InvestPage({this.initialUrl});

  final String initialUrl;

  @override
  _InvestPageState createState() => _InvestPageState();
}

class _InvestPageState extends State<InvestPage> {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                color: Color(0xff202B3B),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'Program Key: ',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'LGWW', style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: WebView(
                onWebViewCreated: (webViewController) {
                  _webViewController = webViewController;
                },
                initialUrl: widget.initialUrl,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ]
        )
      )
    );
  }
}