import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  WebView webView;
  WebViewController webViewController;
  String script = '''
    nameSpan = document.getElementById("name");
    nameSpan.innerHTML = "MarliceLoka";
    
    textInput = document.getElementById("textInput");
    textInput.value = "Meu valor";
    
    submitButton = document.getElementById("submitButton");
    submitButton.click();
    
    after10 = function() {
      submitButton.hidden = true;
    }
    
    after20 = function() {
      window.location.href = "https://www.google.com/";
    }
    
    setTimeout(after10, 10000);
    setTimeout(after20, 20000);

  ''';

  @override
  Widget build(BuildContext context) {
    stdout.writeln("build");
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
          ),
          body: WebView(
            initialUrl: "http://192.168.15.4:8000/",
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: onWebViewCreated,
            onPageFinished: onPageFinished,
          )
      ),
    );
  }

  void onWebViewCreated(WebViewController webViewController) {
    stdout.writeln("onWebViewCreated");

    this.webViewController = webViewController;
  }

  void onPageFinished(String url) {
    stdout.writeln("onPageFinished");
    webViewController.evaluateJavascript(script);
  }
}