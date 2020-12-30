import 'package:financial_planning/widgets/web_app_bar.dart';
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
      appBar: webAppBar(
        _webViewController, 
        widget.initialUrl
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
                  setState(() {
              
                  });
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