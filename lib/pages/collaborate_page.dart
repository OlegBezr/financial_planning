import 'package:financial_planning/widgets/web_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';

class CollaboratePage extends StatefulWidget {
  CollaboratePage({this.initialUrl});

  final String initialUrl;

  @override
  _CollaboratePageState createState() => _CollaboratePageState();
}

class _CollaboratePageState extends State<CollaboratePage> {
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