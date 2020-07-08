import UIKit

extension UILabel {

    static func makeLabel(
        title: String? = nil,
        alignment: NSTextAlignment = .center,
        fontSize: CGFloat = 20,
        textColor: UIColor = .black
    ) -> UILabel {
        let label = UILabel().layoutable()
        label.text = title
        label.font = .systemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.numberOfLines = 0
        label.textColor = textColor
        return label
    }
}
