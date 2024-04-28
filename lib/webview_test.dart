import 'package:flutter/material.dart';
import 'package:wallpapper/shared/textItem.dart';
import 'package:wallpapper/shared/web_view.dart';

class WebViewTest extends StatelessWidget {
  const WebViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AppWebViewWidget(
                      link: "https://www.youtube.com/",
                    ),
                  ),
                );
              },
              child: const TextItem(
                text: "Click",
              ),
            ),
          )
        ],
      ),
    );
  }
}
