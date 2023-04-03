//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <plugin_dialog/plugin_dialog_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) plugin_dialog_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "PluginDialogPlugin");
  plugin_dialog_plugin_register_with_registrar(plugin_dialog_registrar);
}
