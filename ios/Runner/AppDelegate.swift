import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    override func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    
    func getData(data : String) -> String {
        var result : String = ""
        
        let data1 = data.suffix(from: data.index(after: data.firstIndex(of: "(") ?? data.startIndex))
        
        let data2 = data1.prefix(upTo: data1.index(before: data1.endIndex))
        
        result = String(data2)
        
        return result
    }
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
//    let data : String = "Optional(21.406953)"
//    print(self.getData(data: data))
//
//    print(data)
//    print(data.distance(from: data.startIndex, to: data.endIndex))
//    print(data.distance(from: data.firstIndex(of: "(") ?? data.startIndex, to: data.endIndex))
//    print(data.suffix(from: data.firstIndex(of: "(") ?? data.startIndex))
//    print(data.suffix(from: data.index(after: data.firstIndex(of: "(") ?? data.startIndex)))
//
//    var newData : String = String(data.suffix(from: data.index(after: data.firstIndex(of: "(") ?? data.startIndex)))
//
//    // newData.index(before: newData.endIndex)
//    print(newData)
//    print(newData.prefix(upTo: newData.index(before: newData.endIndex)))
//
//    print(newData.prefix(upTo: newData.firstIndex(of: ")") ?? newData.endIndex))
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
                
                viewToPush.callback = {(latitude, longitude) in
                    
                    print(String.init(describing: latitude).contains("("))
                    
                    let latitudeData : String = String.init(describing: latitude)
                    let longitudeData : String = String.init(describing: longitude)
                    
                    print(self.getData(data: latitudeData))
                    
                    let map = [
                        "latitude": self.getData(data: latitudeData),
                        "longitude": self.getData(data: longitudeData)
                    ]
                    
                    flutterResult(map)
                    

                    
                    }
                
                let navigationController = UINavigationController(rootViewController: flutterViewController)
                
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window?.makeKeyAndVisible()
                self.window.rootViewController = navigationController
                navigationController.isNavigationBarHidden = true
                navigationController.pushViewController(viewToPush, animated: true)
                
//                flutterResult([
//                    "latitude":"100",
//                    "longitude":"50"
//                ])
            })
        }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
