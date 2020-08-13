import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyBkHUd2glotsT3LLtJeYd5Lgf8QxKLHKnc")
    
    guard let flutterViewController  = window?.rootViewController as? FlutterViewController else {
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    let flutterChannel = FlutterMethodChannel.init(name: "openTheGoogleMap", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)
    
    flutterChannel.setMethodCallHandler { (flutterMethodCall, flutterResult) in
        if flutterMethodCall.method == "getUserLocation" {
            UIView.animate(withDuration: 0.5, animations: {
                self.window?.rootViewController = nil
                
                let viewToPush = MapViewController()
                
                let navigationController = UINavigationController(rootViewController: flutterViewController)
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.makeKeyAndVisible()
                self.window.rootViewController = navigationController
                navigationController.isNavigationBarHidden = true
                navigationController.pushViewController(viewToPush, animated: true)
                
                flutterResult([
                    "latitude":"100",
                    "longitude":"50"
                ])
            })
        }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
