# plugin_dialog
This is implementation of native dialog in flutter to show dialogs.
## Getting Started

[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## How to use 
 
  TextButton(
        onPressed: () async {
           // To show Dialog of Native 
           await PluginDialog.showDialog();
        },
       child: Text("Show Dialog ")
      )
