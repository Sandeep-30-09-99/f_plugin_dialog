package com.example.plugin_dialog

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) :
    PlatformView {
    private val textView: TextView

    override fun getView(): View {
        return textView
    }

    override fun dispose() {

    }

    init {
        textView = TextView(context)
        textView.textSize = 16f
        textView.setTextColor(Color.rgb(255, 0, 0))
        textView.text = "Rendered d: $id)"
    }
}