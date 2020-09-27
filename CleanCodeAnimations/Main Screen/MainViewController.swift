import UIKit

final class MainViewController: UIViewController {

    let mainView: MainView

    init(
        backgroundColors: [UIColor],
        animationsWrapper: UIViewAnimationsWrapper.Type = UIView.self
    ) {
        mainView = MainView(backgroundColors: backgroundColors, animationsWrapper: animationsWrapper)!
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }

    override func loadView() {
        view = mainView
    }
}
