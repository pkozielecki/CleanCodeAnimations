import UIKit

protocol UIAnimationsWrapper {
    static func animate(withDuration duration: TimeInterval, animations: @escaping () -> Void, completion: ((Bool) -> Void)?)
}

extension UIView: UIAnimationsWrapper {

}
