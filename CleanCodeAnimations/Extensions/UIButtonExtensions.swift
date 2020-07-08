import UIKit

extension UIButton {

    static func makeButton(with title: String? = nil) -> UIButton {
        let normalBackground = UIImage.makeImage(withColor: .red)
        let disabledBackground = UIImage.makeImage(withColor: .gray)
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
