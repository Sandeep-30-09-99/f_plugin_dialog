import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

typedef void WebViewCreatedCallback(WebController controller);

class NativeWeb extends StatefulWidget {

  final WebViewCreatedCallback onWebCreated;

  NativeWeb({
    Key? key,
     required this.onWebCreated,
  });

  @override
  _NativeWebState createState() => _NativeWebState();
}

class _NativeWebState extends State<NativeWeb> {
  @override
  Widget build(BuildContext context) {
    if(defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: '<platform-view-type>',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else if(defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: '<platform-view-type>',
        onPlatformViewCreated: onPlatformViewCreated,
        creationParamsCodec: const StandardMessageCodec(),
      );
    }

    return Text('$defaultTargetPlatform is not yet supported by this plugin');
  }

  Future<void> onPlatformViewCreated(id) async {
    if (widget.onWebCreated == null) {
      return;
    }
    widget.onWebCreated(WebController.init(id));
  }

}


class WebController {

  MethodChannel? _channel;
  
  WebController.init(int id) {
    _channel =   const MethodChannel('plugin_dialog');
  }

  Future<void> loadUrl(String url) async {
    return _channel?.invokeMethod('showNativeUi', url);
  }
}
