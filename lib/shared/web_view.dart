import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebViewWidget extends StatefulWidget {
  final String link;

  const AppWebViewWidget({super.key, required this.link});

  @override
  State<AppWebViewWidget> createState() => _AppWebViewWidgetState();
}

class _AppWebViewWidgetState extends State<AppWebViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        // title: MyText(title: 'pay_now'.tr(), color: AppColors.primary),
        // leading: const BackWidget(),
      ),
      body: SafeArea(
          child: WebViewWidget(
              controller: WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..setBackgroundColor(const Color(0x00000000))
                ..setNavigationDelegate(
                  NavigationDelegate(
                    onProgress: (int progress) {
                      // Update loading bar.
                    },
                    onPageStarted: (String url) {},
                    onPageFinished: (String url) {},
                    onWebResourceError: (WebResourceError error) {
                      debugPrint('''
          Page resource error:
        code: ${error.errorCode}
        description: ${error.description}
        errorType: ${error.errorType}
        isForMainFrame: ${error.isForMainFrame}
              ''');
                    },
                    onNavigationRequest: (NavigationRequest request) {
                      // if (request.url.startsWith('https://www.youtube.com/')) {
                      //   print("fffffffffff");
                      //   return NavigationDecision.prevent;
                      // }

                      // debugPrint(
                      //     "navigation url is ${request.url}");
                      // Uri uri = Uri.parse(request.url);
                      // String? responseCode =
                      //     uri.queryParameters['ResponseCode'];
                      // debugPrint("param1Value $responseCode");
                      // if (responseCode == "000") {
                      //   Utils.showMsg("تم الدفع بنجاح".tr());
                      //   Navigator.pop(context);
                      // }
                      return NavigationDecision.navigate;
                    },
                    onUrlChange: (UrlChange change) async {
                      debugPrint('url change to ${change.url}');
                      // if (change.url?.contains("message=APPROVED") == true) {
                      //   Alerts.snack(
                      //       text: "تم الدفع بنجاح".tr(),
                      //       state: SnackState.success);
                      //   Utils.userModel.hasPlan = true;
                      //
                      //   await Utils.saveUserInHive(Utils.userModel.toJson());
                      //   Future.delayed(Duration(seconds: 2)).then((value) =>
                      //       Navigator.pushNamedAndRemoveUntil(
                      //           context, Routes.splashRoute, (route) => false));
                      // }
                    },
                  ),
                )
                ..loadRequest(Uri.parse(widget.link)))),
    );
  }
}
