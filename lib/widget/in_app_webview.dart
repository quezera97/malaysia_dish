import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// ignore: must_be_immutable
class InAppWebViewWidget extends StatelessWidget {
  InAppWebViewWidget({super.key, required this.url});

  final String url;

  InAppWebViewController? webView;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
      initialOptions:
          InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
      onWebViewCreated: (InAppWebViewController controller) {
        webView = controller;
      },
    );
  }
}
