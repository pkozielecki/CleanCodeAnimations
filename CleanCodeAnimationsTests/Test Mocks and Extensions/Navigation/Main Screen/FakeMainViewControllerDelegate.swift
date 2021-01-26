import UIKit
@testable import CleanCodeAnimations
import Mimus

final class FakeMainViewControllerDelegate: MainViewControllerDelegate, Mock {
    var storage: [RecordedCall] = []

    func mainViewController(_ viewController: MainViewController, didChangeBackgroundColor color: UIColor) {
        recordCall(withIdentifier: "didChangeBackgroundColor", arguments: [color])
    }

    func mainViewController(_ viewController: MainViewController, didRequestExitingCount count: Int) {
        recordCall(withIdentifier: "didRequestExitingCount", arguments: [count])
    }

    func mainViewController(_ viewController: MainViewController, didRequestHelpInitially isInitial: Bool) {
        recordCall(withIdentifier: "didRequestHelpInitially", arguments: [isInitial])
    }
}
