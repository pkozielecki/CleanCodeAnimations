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

    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier = CGFloat(255.999999)

        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        if alpha == 1.0 {
            return String(
                format: "#%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier)
            )
        }
        else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                Int(red * multiplier),
                Int(green * multiplier),
                Int(blue * multiplier),
                Int(alpha * multiplier)
            )
        }
    }
}
