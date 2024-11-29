//package com.example.lab141
//
//import io.flutter.embedding.android.FlutterActivity
//
//class MainActivity: FlutterActivity()

//package com.example.lab141
//
//import android.os.Bundle
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.plugin.common.MethodChannel
//import io.flutter.plugins.GeneratedPluginRegistrant
//
//class MainActivity : FlutterActivity() {
//    private val CHANNEL = "com.example.native_camera_app/native"
//
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//
//        MethodChannel(flutterEngine?.dartMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            if (call.method == "getStaticString") {
//                result.success("Hello from Native Android!")
//            } else {
//                result.notImplemented()
//            }
//        }
//    }
//}

package com.example.lab141

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.lab141/native"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine?.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getStaticString") {
                result.success("Hello from Native!")
            } else {
                result.notImplemented()
            }
        }
    }
}



