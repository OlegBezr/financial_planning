import 'package:financial_planning/widgets/web_app_bar.dart';
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
      appBar: webAppBar(
        context,
        _webViewController, 
        widget.initialUrl
      ),
      body: SafeArea(
        child: WebView(
          onWebViewCreated: (webViewController) {
            _webViewController = webViewController;
            setState(() {
              
            });
          },
          initialUrl: widget.initialUrl,
          javascriptMode: JavascriptMode.unrestricted,
        )
      )
    );
  }
}