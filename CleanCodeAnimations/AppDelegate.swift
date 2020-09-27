import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainViewController(backgroundColors: [.white, .yellow, .darkGray, .orange])
        window?.makeKeyAndVisible()
        return true
    }
}

