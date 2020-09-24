//
//  FakeUIAnimationsWrapper.swift  
//  CleanCodeAnimations
//

import UIKit

@testable import CleanCodeAnimations

final class FakeUIAnimationsWrapper: UIAnimationsWrapper {
    class func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?) {
        animations()
        completion?(true)
    }
}
