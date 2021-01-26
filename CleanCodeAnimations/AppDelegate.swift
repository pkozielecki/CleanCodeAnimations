import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let windowController = WindowController()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = windowController.makeUIWindow()
        window?.makeKeyAndVisible()
        return true
    }
}

