import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// ignore: depend_on_referenced_packages
// import 'package:get/get.dart';

class CustomWebViewPage extends ConsumerWidget {
  CustomWebViewPage({Key? key, required this.url, required this.onComplete})
      : super(key: key);

  final String? url;
  final Function onComplete;
  final _key = UniqueKey();
  final ValueNotifier<bool> loadingState = ValueNotifier(true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        return onComplete();
      },
      child: Scaffold(
         appBar: AppBar(),
        body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: loadingState,
              builder: (context, value, child) {
                return Stack(
                  children: [
                    InAppWebView(
                      initialUrlRequest: URLRequest(
                          url: Uri.parse(
                        url!,
                      )),
                      key: _key,
                      onLoadStop: (controller, url) {
                        log("Stoped");
                        loadingState.value = false;
                      },
                      initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                        supportZoom: true,
                        javaScriptCanOpenWindowsAutomatically: true,
                      )),
                      onReceivedServerTrustAuthRequest:
                          (controller, challenge) async {
                        //  print("This is cause of the challenge $challenge");
                        return ServerTrustAuthResponse(
                            action: ServerTrustAuthResponseAction.PROCEED);
                      },
                      onWebViewCreated: (controller) {},
                    ),
                    loadingState.value
                        ? const Center(child: CircularProgressIndicator())
                        : const SizedBox(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
