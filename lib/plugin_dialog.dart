import 'package:flutter/services.dart';

class PluginDialog {
  
   Future<String?> getPlatformVersion() {
    return _channel.invokeMethod("getPlatformVersion");
  }

  static const MethodChannel _channel = MethodChannel("plugin_dialog");

  static Future<void> showDialog() async {
    await _channel.invokeMethod("showDialog");
  }

}
