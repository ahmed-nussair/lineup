package com.nussair.lineup;

import android.content.Intent;

import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity{

    private static final String OPEN_GOOGLE_MAP_CHANNEL = "openTheGoogleMap";

    private static final int USER_CURRENT_LOCATION = 0;
    private static final int NEAREST_RESTAURANT_BRANCH = 1;

    private MethodChannel.Result result;

    @Override
    public void configureFlutterEngine(@NotNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), OPEN_GOOGLE_MAP_CHANNEL)
            .setMethodCallHandler(
                (call, result) -> {
                    // Note: this method is invoked on the main thread.
                    this.result = result;
                    if(call.method.equals("getUserLocation")) {
                        Intent intent = new Intent(MainActivity.this, UserLocationActivity.class);
                        startActivityForResult(intent, USER_CURRENT_LOCATION);
                    }

                }
            );
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if(requestCode == USER_CURRENT_LOCATION) {
            double latitude = data.getDoubleExtra("latitude", 0.0);
            double longitude = data.getDoubleExtra("longitude", 0.0);

            Map<String, String> map = new HashMap<>();
            map.put("latitude", "" + latitude);
            map.put("longitude", "" + longitude);

            result.success(map);
        }
    }
}
