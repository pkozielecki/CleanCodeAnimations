import UIKit
@testable import CleanCodeAnimations

final class FakeMainViewControllerDelegate: MainViewControllerDelegate {

    private(set) var lastSetBackgroundColor: UIColor?
    private(set) var lastSetExitRequestCount: Int?
    private(set) var lastSetDidRequestHelpInitially: Bool?

    func mainViewController(_ viewController: MainViewController, didChangeBackgroundColor color: UIColor) {
        lastSetBackgroundColor = color
    }

    func mainViewController(_ viewController: MainViewController, didRequestExitingCount count: Int) {
        lastSetExitRequestCount = count
    }

    func mainViewController(_ viewController: MainViewController, didRequestHelpInitially isInitial: Bool) {
        lastSetDidRequestHelpInitially = isInitial
    }
}
