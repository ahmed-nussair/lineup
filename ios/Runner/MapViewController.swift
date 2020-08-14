//
//  MapViewController.swift
//  Runner
//
//  Created by Ahmed Nussair on 8/13/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController , GMSMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
//        setUpNavBar()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }


//    func setUpNavBar(){
//        self.navigationItem.title = "IOS component"
////        self.navigationController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "back", style: UIBarButtonItem.Style.done, target: self, action: nil)
//
//    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.navigationBar.barTintColor = UIColor(red:  34/255.0, green: 149/255.0, blue: 243/255.0, alpha: 100.0/100.0)
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = self.uicolorFromHex(rgbValue: 0xffffff)
//        // change navigation item title color
//
//
//        self.navigationController?.isNavigationBarHidden = false
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 24.707042, longitude: 46.670826, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        
        mapView.delegate = self
        
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 24.707042, longitude: 46.670826)
        marker.title = "Ar-Riyyad"
        marker.snippet = "Saudi Arabia"
        marker.map = mapView
        
        let currentLocationButton = CurrentLocationButton()
        
        currentLocationButton.setBackgroundImage(UIImage(named: "current_location") ,for : UIControl.State.normal)
        
        currentLocationButton.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        
        
        self.view.addSubview(currentLocationButton)
        
        currentLocationButton.translatesAutoresizingMaskIntoConstraints = false
        
        currentLocationButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    
        
        currentLocationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        
        let backButton = BackButton()
        
        backButton.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        
        backButton.backgroundColor = UIColor(red: 252 / 255, green: 85 / 255, blue: 10 / 255, alpha: 1.0)
        
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: backButton.bounds, byRoundingCorners: .bottomRight, cornerRadii: CGSize(width: 70.0, height: 70.0)).cgPath
        
        backButton.layer.mask = maskLayer
        
        let backButtonImage = UIImageView(image: UIImage(named: "baseline_navigate_before_white_48pt")!)
        backButton.addSubview(backButtonImage)
        
        backButtonImage.translatesAutoresizingMaskIntoConstraints = false
        
        let xConstraint = NSLayoutConstraint(item: backButtonImage, attribute: .centerX, relatedBy: .equal, toItem: backButton, attribute: .centerX, multiplier: 1, constant: 0)

        let yConstraint = NSLayoutConstraint(item: backButtonImage, attribute: .centerY, relatedBy: .equal, toItem: backButton, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([xConstraint, yConstraint])
        
        self.view.addSubview(backButton)
        
        let titleView = UIView()
        
        titleView.frame = CGRect(x: 0, y: 100, width: 500, height: 50)
        
        titleView.backgroundColor = UIColor.white
        
        let title = UILabel()
        
        title.text = "Choose Your Location"
        
        titleView.addSubview(title)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        
        title.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        
        title.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        self.view.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        titleView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        titleView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
       
        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: titleView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30),
            NSLayoutConstraint(item: titleView, attribute: .topMargin, relatedBy: .equal, toItem: backButton, attribute: .bottom, multiplier: 1, constant: 30)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
//        self.navigationController?.popToRootViewController(animated: true)
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        mapView.clear()
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.map = mapView
    }

}
