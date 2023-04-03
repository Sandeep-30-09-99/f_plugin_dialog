#ifndef FLUTTER_PLUGIN_PLUGIN_DIALOG_PLUGIN_H_
#define FLUTTER_PLUGIN_PLUGIN_DIALOG_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace plugin_dialog {

class PluginDialogPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PluginDialogPlugin();

  virtual ~PluginDialogPlugin();

  // Disallow copy and assign.
  PluginDialogPlugin(const PluginDialogPlugin&) = delete;
  PluginDialogPlugin& operator=(const PluginDialogPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace plugin_dialog

#endif  // FLUTTER_PLUGIN_PLUGIN_DIALOG_PLUGIN_H_
