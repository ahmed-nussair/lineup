package com.nussair.lineup;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.MotionEvent;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentActivity;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;

import java.util.Objects;

public class UserLocationActivity extends FragmentActivity implements OnMapReadyCallback {

    private GoogleMap mMap;
    private ImageView currentLocationImageView;
    private RelativeLayout backButton;

    private double latitude;
    private double longitude;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_user_location);
        // Obtain the SupportMapFragment and get notified when the map is ready to be used.
        SupportMapFragment mapFragment = (SupportMapFragment) getSupportFragmentManager()
                .findFragmentById(R.id.map);
        Objects.requireNonNull(mapFragment).getMapAsync(this);

        setTitle("Get Your Location");
    }

    /**
     * Manipulates the map once available.
     * This callback is triggered when the map is ready to be used.
     * This is where we can add markers or lines, add listeners or move the camera. In this case,
     * we just add a marker near Sydney, Australia.
     * If Google Play services is not installed on the device, the user will be prompted to install
     * it inside the SupportMapFragment. This method will only be triggered once the user has
     * installed Google Play services and returned to the app.
     */
    @SuppressLint("ClickableViewAccessibility")
    @Override
    public void onMapReady(GoogleMap googleMap) {
        mMap = googleMap;

        LocationService locationService = LocationService.getLocationManager(this);

        LatLng current = new LatLng(locationService.getLatitude(), locationService.getLongitude());
        mMap.addMarker(new MarkerOptions().position(current));
        mMap.moveCamera(CameraUpdateFactory.newLatLng(current));

        latitude = current.latitude;
        longitude = current.longitude;

        TextView mapTitle = findViewById(R.id.mapTitle);
        mapTitle.setText("Choose your location");

        backButton = findViewById(R.id.backButton);
        currentLocationImageView = findViewById(R.id.currentLocationImageView);

        mMap.setOnMapClickListener(latLng -> {
            mMap.clear();
            mMap.addMarker(new MarkerOptions().position(latLng));
            mMap.animateCamera(CameraUpdateFactory.newLatLng(latLng));
            latitude = latLng.latitude;
            longitude = latLng.longitude;
        });

        currentLocationImageView.setOnClickListener(v -> {
            mMap.clear();
            LocationService location = LocationService.getLocationManager(this);
            LatLng marker = new LatLng(location.getLatitude(), location.getLongitude());
            mMap.addMarker(new MarkerOptions().position(marker));
            mMap.animateCamera(CameraUpdateFactory.newLatLngZoom(marker, 15));
            latitude = location.getLatitude();
            longitude = location.getLongitude();
        });

        currentLocationImageView.setOnTouchListener((v, event) -> {
            if(event.getAction() == MotionEvent.ACTION_DOWN) {
                currentLocationImageView.setBackgroundColor(Color.GRAY);
                return  true;
            } else if (event.getAction() == MotionEvent.ACTION_UP) {
                currentLocationImageView.setBackgroundColor(Color.TRANSPARENT);
                v.performClick();
                return true;
            }

            return  false;
        });

        backButton.setOnClickListener(v -> {
            Intent intent = new Intent();
            intent.putExtra("latitude", latitude);
            intent.putExtra("longitude", longitude);
            setResult(0, intent);
            finish();
        });
    }
}