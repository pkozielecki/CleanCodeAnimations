import UIKit

extension UIColor {

    static func random(
        hue: CGFloat = CGFloat.random(in: 0...1),
        saturation: CGFloat = CGFloat.random(in: 0.5...1),
        brightness: CGFloat = CGFloat.random(in: 0.5...1),
        alpha: CGFloat = 1
    ) -> UIColor {
        UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}
