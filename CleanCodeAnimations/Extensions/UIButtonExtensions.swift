import UIKit

extension UIButton {

    static func makeButton(
        with title: String? = nil,
        activeBgColor: UIColor = .red,
        inactiveBgColor: UIColor = .gray
    ) -> UIButton {
        let normalBackground = UIImage.makeImage(withColor: activeBgColor)
        let disabledBackground = UIImage.makeImage(withColor: inactiveBgColor)
        let button = UIButton(type: .system).layoutable()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(normalBackground, for: .normal)
        button.setBackgroundImage(disabledBackground, for: .disabled)
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }
}
