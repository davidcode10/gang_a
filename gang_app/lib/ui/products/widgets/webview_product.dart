import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewProduct extends StatefulWidget {
  const WebViewProduct({Key? key}) : super(key: key);

  @override
  State<WebViewProduct> createState() => _WebViewProductState();
}

class _WebViewProductState extends State<WebViewProduct> {
  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}