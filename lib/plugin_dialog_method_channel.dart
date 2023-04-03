import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_dialog_platform_interface.dart';

/// An implementation of [PluginDialogPlatform] that uses method channels.
class MethodChannelPluginDialog extends PluginDialogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_dialog');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }


}
