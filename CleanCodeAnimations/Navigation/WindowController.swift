import UIKit

final class WindowController {
    
    let navController = UINavigationController()
    
    init() {
        setupNavController()
    }
    
    func makeUIWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController = MainViewController(backgroundColors: [.white, .yellow, .darkGray, .orange])
        mainViewController.delegate = self
        navController.viewControllers = [mainViewController]
        window.rootViewController = navController
        return window
    }
}

extension WindowController: MainViewControllerDelegate {
    
    func mainViewController(_ viewController: MainViewController, didChangeBackgroundColor color: UIColor) {
        let currentColor = color.hexString ?? "unknown"
        showAlert(title: "BG color changed", message: "New color: \(currentColor)")
    }

    func mainViewController(_ viewController: MainViewController, didRequestExitingCount count: Int) {
        showAlert(title: "Exit requested", message: "You requested exit \(count) times")
    }

    func mainViewController(_ viewController: MainViewController, didRequestHelpInitially isInitial: Bool) {
        let suffix = isInitial ? "" : " again, we get it already! :troll:"
        showAlert(title: "Help requested", message: "You requested help\(suffix)")
    }
}

private extension WindowController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        navController.present(alert, animated: true)
    }

    func setupNavController() {
        navController.setNavigationBarHidden(true, animated: false)
    }
}
