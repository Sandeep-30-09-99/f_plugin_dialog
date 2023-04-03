#include "include/plugin_dialog/plugin_dialog_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "plugin_dialog_plugin.h"

void PluginDialogPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  plugin_dialog::PluginDialogPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
