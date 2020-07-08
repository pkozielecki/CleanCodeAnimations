import UIKit

final class MainViewController: UIViewController {
    
    override func loadView() { 
        view = MainView(backgroundColors: [.white, .yellow, .darkGray, .orange])
    }
}

private extension MainViewController {
    
    var mainView: MainView {
        view as! MainView
    }
}
