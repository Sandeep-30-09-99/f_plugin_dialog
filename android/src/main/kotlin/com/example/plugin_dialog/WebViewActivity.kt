package com.example.plugin_dialog;

import android.app.Activity
import android.os.Bundle
import android.view.KeyEvent
import android.view.Window
import android.webkit.WebView
import android.webkit.WebViewClient

class WebViewActivity : Activity() {
 
    private var mWebView: WebView? = null
    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        actionBar?.setDisplayHomeAsUpEnabled(true)
        window.requestFeature(Window.FEATURE_NO_TITLE)
        mWebView = WebView(this)
        val extras = intent.extras
        mWebView!!.loadUrl(extras?.getString("URL")!!)
        mWebView!!.webViewClient = object : WebViewClient() {
            override fun shouldOverrideUrlLoading(view: WebView, url: String): Boolean {
                view.loadUrl(url)
                return true
            }
        }
        this.setContentView(mWebView)
    }
   
    override fun onKeyDown(keyCode: Int, event: KeyEvent): Boolean {
        if (keyCode == KeyEvent.KEYCODE_BACK && mWebView!!.canGoBack()) {
            mWebView!!.goBack()
            return true
        }
        return super.onKeyDown(keyCode, event)
    }
}