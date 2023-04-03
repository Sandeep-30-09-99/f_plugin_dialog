import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_dialog/plugin_dialog.dart';
import 'package:plugin_dialog/plugin_dialog_platform_interface.dart';
import 'package:plugin_dialog/plugin_dialog_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPluginDialogPlatform
    with MockPlatformInterfaceMixin
    implements PluginDialogPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PluginDialogPlatform initialPlatform = PluginDialogPlatform.instance;

  test('$MethodChannelPluginDialog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPluginDialog>());
  });

  test('getPlatformVersion', () async {
    PluginDialog pluginDialogPlugin = PluginDialog();
    MockPluginDialogPlatform fakePlatform = MockPluginDialogPlatform();
    PluginDialogPlatform.instance = fakePlatform;

    expect(await pluginDialogPlugin.getPlatformVersion(), '42');
  });
}
