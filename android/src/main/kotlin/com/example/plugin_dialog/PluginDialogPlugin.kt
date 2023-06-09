package com.example.plugin_dialog

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** PluginDialogPlugin */
class PluginDialogPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var context: Activity
    private lateinit var flutterPluginBinding: FlutterPluginBinding
    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_dialog")
                this.flutterPluginBinding = flutterPluginBinding
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "<platform-view-type>",
            NativeViewFactory()
        )
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        Log.i("NativeMsg", call.method)
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "showDialog" -> {
                val dialog = Dialog(context)
                dialog.setTitle("Hi, My Name is Flutter")
                dialog.show()
                print("NativeMsg :: Show Dialog completed")
                Log.i("NativeMsg", "ShowDialogCalled")
            }
            "showNativeUi" -> {
                Log.i("Rqsssss", "sssssss")
                try {
                    flutterPluginBinding.platformViewRegistry.registerViewFactory(
                        "<platform-view-type>",
                        NativeViewFactory()
                    )
                    result.success(null)
                } catch (e: java.lang.Exception) {
                    Log.i("RqssssEE", e.localizedMessage)
                }
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        context = binding.activity

    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        context = binding.activity
    }

    override fun onDetachedFromActivity() {

    }
}
