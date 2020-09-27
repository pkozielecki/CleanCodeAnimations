import UIKit

protocol UIViewAnimationsWrapper: AnyObject {
    static func animate(
        withDuration duration: TimeInterval, 
        animations: @escaping () -> Void, 
        completion: ((Bool) -> Void)?
    )
}
extension UIView: UIViewAnimationsWrapper {}
