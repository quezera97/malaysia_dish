import 'package:flutter/material.dart';

import 'floating_action_button.dart';
import 'in_app_webview.dart';

class NavigateToWebView extends StatefulWidget {
  const NavigateToWebView({super.key, required this.youtubeUrl});

  final String youtubeUrl;

  @override
  State<NavigateToWebView> createState() => _NavigateToWebViewState();
}

class _NavigateToWebViewState extends State<NavigateToWebView> {
  String urlInAppWebView = '';

  @override
  void initState() {
    super.initState();
    getUrl(widget.youtubeUrl);
  }

  Future<void> getUrl(url) async {
    final urlPattern = RegExp(r'https://[^\s]+');
    final match = urlPattern.firstMatch(url);

    if (match != null) {
      final url = match.group(0);

      setState(() {
        urlInAppWebView = url!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.transparent)),
              child: InAppWebViewWidget(url: urlInAppWebView),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatButtonWidget(url: urlInAppWebView),
    );
  }
}
