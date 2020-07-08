import UIKit

extension UIControl {

    func simulateTap() {
        if isUserInteractionEnabled {
            sendActions(for: .touchUpInside)
        }
    }
}
