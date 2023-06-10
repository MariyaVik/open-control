import 'package:flutter/material.dart';
import 'package:open_control/ui/common/app_bar_back.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({required this.link, super.key});
  final String link;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool isLoading = true;
  late WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          debugPrint('WebView is loading (progress : $progress%)');
        },
        onPageStarted: (String url) {
          debugPrint('Page started loading: $url');
          isLoading = true;
        },
        onPageFinished: (String url) {
          debugPrint('Page finished loading: $url');
          isLoading = false;
          setState(() {});
        },
      ))
      ..clearCache()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBack(context),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
