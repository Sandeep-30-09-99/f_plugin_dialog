import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:plugin_dialog/nativeweb.dart';
import 'package:plugin_dialog/plugin_dialog.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _pluginDialogPlugin = PluginDialog();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _pluginDialogPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  void showNative() async {
    return await _pluginDialogPlugin.showButton();
  }

  @override
  Widget build(BuildContext context) {
    return getSimpleWidgetTestingPlugin();
  }

  Widget getSimpleWidgetTestingPlugin() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Header"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(onPressed: () {}, child: Text("Custom button")),
              SizedBox(
                width: 20,
                height: 20,
              ),
              Text("Native Version ${_platformVersion}"),
              TextButton(
                  onPressed: () async {
                    await PluginDialog.showDialog();
                  },
                  child: Text("Show Dialog "))
            ],
          ),
        ),
      ),
    );
  }

  Widget getAndroidViewWidget() {
    return MediaQuery(
      data: const MediaQueryData(size: Size(30, 100)),
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Header"),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 50,
                    child: Expanded(
                        child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Container(
                          height: 30,
                          child: getPV(),
                        ),
                      ),
                    ))),
                ElevatedButton(onPressed: () {}, child: Text("FDf"))
              ],
            ),
          )),
    );
  }

  late WebController controller;

  Widget getPV() {
    return NativeWeb(onWebCreated: onWebCreated);
  }

  void onWebCreated(WebController web) {
    this.controller = web;
    controller.loadUrl("url");
  }

  Widget getPlatformViewLinkWidget() {
    const String viewType = '<platform-view-type>';
    const Map<String, dynamic> creationParams = <String, dynamic>{};
    return PlatformViewLink(
        viewType: viewType,
        surfaceFactory: (context, controller) {
          return AndroidViewSurface(
            controller: controller as AndroidViewController,
            gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
          );
        },
        onCreatePlatformView: (params) {
          return PlatformViewsService.initSurfaceAndroidView(
            id: params.id,
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            onFocus: () {
              params.onFocusChanged(true);
            },
          );
        });
  }
}
