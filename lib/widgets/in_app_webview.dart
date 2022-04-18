import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    //print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    //print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    //print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    //print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    //print("Progress: $progress");
  }

  @override
  void onExit() {
    //print("Browser closed!");
  }
}

Future<void> inAppBrowser(String url) {
  final MyInAppBrowser browser = new MyInAppBrowser();
  var options = InAppBrowserClassOptions(
      crossPlatform: InAppBrowserOptions(hideUrlBar: false),
      inAppWebViewGroupOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)));
  return browser.openUrlRequest(
      urlRequest: URLRequest(url: Uri.parse(url.trim())), options: options);
}
