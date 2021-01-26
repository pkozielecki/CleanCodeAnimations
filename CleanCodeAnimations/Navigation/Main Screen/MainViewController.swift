import UIKit

protocol MainViewControllerDelegate: AnyObject {
    
    func mainViewController(_ viewController: MainViewController, didChangeBackgroundColor color: UIColor)
    func mainViewController(_ viewController: MainViewController, didRequestExitingCount count: Int)
    func mainViewController(_ viewController: MainViewController, didRequestHelpInitially isInitial: Bool)
}

final class MainViewController: UIViewController {

    let mainView: MainView
    weak var delegate: MainViewControllerDelegate?

    init(
        backgroundColors: [UIColor],
        animationsWrapper: UIViewAnimationsWrapper.Type = UIView.self
    ) {
        mainView = MainView(backgroundColors: backgroundColors, animationsWrapper: animationsWrapper)!
        super.init(nibName: nil, bundle: nil)
        setupViewCallbacks()
    }

    required init?(coder: NSCoder) {
        fatalError("Not supported")
    }

    override func loadView() {
        view = mainView
    }
}

private extension MainViewController {

    func setupViewCallbacks() {
        mainView.onBackgroundColorChanged = { [unowned self] color in
            delegate?.mainViewController(self, didChangeBackgroundColor: color)
        }
        mainView.onExitButtonTap = { [unowned self] count in
            delegate?.mainViewController(self, didRequestExitingCount: count)
        }
        mainView.onHelpButtonTap = { [unowned self] isInitial in
            delegate?.mainViewController(self, didRequestHelpInitially: isInitial)
        }
    }
}
