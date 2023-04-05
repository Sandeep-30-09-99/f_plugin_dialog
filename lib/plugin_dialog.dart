import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PluginDialog {
  Future<String?> getPlatformVersion() {
    return _channel.invokeMethod("getPlatformVersion");
  }

  static const MethodChannel _channel = MethodChannel("plugin_dialog");

  static Future<void> showDialog() async {
    await _channel.invokeMethod("showDialog");
  }

  static Widget customButton(void Function() onPressed, Widget child) {
    return CustomButton(onPressed: onPressed, child: child);
  }

  Future<void> showButton() async {
    return await _channel.invokeMethod("showNativeUi");
  }
}

class CustomButton extends StatefulWidget {
final void Function() onPressed;
  final Widget child;
 final ButtonStyle? style;

  const CustomButton(
      {Key? key, required this.onPressed, required this.child, this.style})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          elevation: 9.0,
          textStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        child: widget.child);
  }
}
