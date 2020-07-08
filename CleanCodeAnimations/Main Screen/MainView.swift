import UIKit

final class MainView: UIView {

    let button = UIButton.makeButton(with: "Change BG color")
    let label = UILabel.makeLabel(title: "Clean Code - Animations")
    let backgroundColors: [UIColor]

    private let animationDuration = 0.3
    private var backgroundColorIndex: Int = 0

    init?(backgroundColors: [UIColor]) {
        guard backgroundColors.count >= 2 else {
            return nil
        }
        self.backgroundColors = backgroundColors
        super.init(frame: .zero)
        backgroundColor = backgroundColors[backgroundColorIndex]
        layoutable()
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

private extension MainView {

    @objc private func didTapChangeBgButton(sender: UIButton) {
        button.isUserInteractionEnabled = false
        changeBackgroundColor(animated: true)
    }

    func changeBackgroundColor(animated: Bool) {
        if animated {
            UIView.animate(withDuration: animationDuration, animations: { [weak self] in
                self?.applyBackgroundColorChange()
            }, completion: { [weak self] completed in 
                self?.button.isUserInteractionEnabled = true
            })
        } else {
            applyBackgroundColorChange()
            button.isUserInteractionEnabled = true
        }
    }

    func applyBackgroundColorChange() {
        backgroundColorIndex += 1
        if backgroundColorIndex == backgroundColors.count {
            backgroundColorIndex = 0
        }
        backgroundColor = backgroundColors[backgroundColorIndex]
    }

    func setupSubviews() {
        addSubview(button)
        addSubview(label)
        button.addTarget(self, action: #selector(didTapChangeBgButton), for: .touchUpInside)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 100),

                button.centerYAnchor.constraint(equalTo: centerYAnchor),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ]
        )
    }
}
