import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsView extends StatefulWidget {
  final String postUrl;
  const NewsView({required this.postUrl});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  //final Completer<WebViewController> _controller = Completer<WebViewController>();
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.postUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Japan",
                style: TextStyle(color: Colors.red),
              ),
              Text("News"),
            ]),
        actions: <Widget>[
          Opacity(
            opacity: 0.0,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.share)),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
