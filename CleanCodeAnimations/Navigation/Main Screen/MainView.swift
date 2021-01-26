import UIKit

final class MainView: UIView {

    let changeBackgroundButton = UIButton.makeButton(with: "Change BG color")
    let exitButton = UIButton.makeButton(with: "Exit", activeBgColor: .orange)
    let helpButton = UIButton.makeButton(with: "Help", activeBgColor: .blue)
    let label = UILabel.makeLabel(title: "Clean Code - Animations")
    let backgroundColors: [UIColor]
    let animationsWrapper: UIViewAnimationsWrapper.Type

    var onBackgroundColorChanged: ((UIColor) -> Void)?
    var onExitButtonTap: ((Int) -> Void)?
    var onHelpButtonTap: ((Bool) -> Void)?

    private let animationDuration = 0.3
    private var backgroundColorIndex: Int = 0
    private var isInitialCallForHelp: Bool = true
    private var exitCallCount = 0

    init?(
        backgroundColors: [UIColor],
        animationsWrapper: UIViewAnimationsWrapper.Type = UIView.self
    ) {
        guard backgroundColors.count >= 2 else {
            return nil
        }
        self.backgroundColors = backgroundColors
        self.animationsWrapper = animationsWrapper
        super.init(frame: UIScreen.main.bounds)
        backgroundColor = backgroundColors[backgroundColorIndex]
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

private extension MainView {

    @objc private func didTapChangeBgButton(sender: UIButton) {
        changeBackgroundButton.isUserInteractionEnabled = false
        changeBackgroundColor(animated: true)
    }

    @objc private func didTapExitButtonButton(sender: UIButton) {
        exitCallCount += 1
        onExitButtonTap?(exitCallCount)
    }

    @objc private func didTapHelpButton(sender: UIButton) {
        onHelpButtonTap?(isInitialCallForHelp)
        isInitialCallForHelp = false
    }

    func changeBackgroundColor(animated: Bool) {
        if animated {
            animationsWrapper.animate(withDuration: animationDuration, animations: { [weak self] in
                self?.applyBackgroundColorChange()
            }, completion: { [weak self] completed in
                self?.changeBackgroundButton.isUserInteractionEnabled = true
                self?.onBackgroundColorChanged?(self?.backgroundColor ?? .clear)
            })
        } else {
            applyBackgroundColorChange()
            changeBackgroundButton.isUserInteractionEnabled = true
            onBackgroundColorChanged?(backgroundColor ?? .clear)
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
        addSubview(changeBackgroundButton)
        addSubview(exitButton)
        addSubview(helpButton)
        addSubview(label)
        changeBackgroundButton.addTarget(self, action: #selector(didTapChangeBgButton), for: .touchUpInside)
        exitButton.addTarget(self, action: #selector(didTapExitButtonButton), for: .touchUpInside)
        helpButton.addTarget(self, action: #selector(didTapHelpButton), for: .touchUpInside)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: centerXAnchor),
                label.topAnchor.constraint(equalTo: topAnchor, constant: 100),

                changeBackgroundButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                changeBackgroundButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                changeBackgroundButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

                helpButton.topAnchor.constraint(equalTo: changeBackgroundButton.bottomAnchor, constant: 10),
                helpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                helpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

                exitButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
                exitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                exitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            ]
        )
    }
}
