import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_dialog_method_channel.dart';

abstract class PluginDialogPlatform extends PlatformInterface {
  /// Constructs a PluginDialogPlatform.
  PluginDialogPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginDialogPlatform _instance = MethodChannelPluginDialog();

  /// The default instance of [PluginDialogPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginDialog].
  static PluginDialogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginDialogPlatform] when
  /// they register themselves.
  static set instance(PluginDialogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
