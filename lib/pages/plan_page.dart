import 'package:financial_planning/widgets/web_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class PlanPage extends StatefulWidget {
  PlanPage({this.initialUrl});

  final String initialUrl;

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: webAppBar(
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