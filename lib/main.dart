import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WebView webView;
  WebViewController webViewController;
  String script = "nameSpan = document.getElementById(\"name\"); nameSpan.innerHTML = \"MarliceLoka\";";

  void alert(String url) {
    webViewController.evaluateJavascript(script);
  }

  void saveWebViewController(WebViewController webViewController) {
    this.webViewController = webViewController;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: WebView(
          initialUrl: "http://192.168.15.4:8000/",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: saveWebViewController,
          onPageFinished: alert,
        )
      ),
    );
  }
}