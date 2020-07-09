import UIKit

@testable import CleanCodeAnimations

class FakeAnimationsWrapper: UIViewAnimationsWrapper {

    class func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        animations()
        completion?(true)
    }
}
