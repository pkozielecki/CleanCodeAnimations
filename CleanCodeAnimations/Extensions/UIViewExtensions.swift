import UIKit

extension UIView {

    /// Anchor of the view.
    enum Anchor {
        case top
        case leading
        case bottom
        case trailing
    }

    /// Configures an existing view to not convert the autoresizing mask into constraints.
    /// - Returns: A configured view.
    @discardableResult func layoutable() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }

    /// Constraint edges of the view to its superview edges
    ///
    ///  - WARNING: Causes a fatal error in case there are no superview.
    /// - Parameters:
    ///   - excludingAnchors: Anchros that shouldn't be constraint
    ///   - insets: Insets to use, .zero by default
    /// - Returns: Created constraints
    @discardableResult func constraintToSuperviewEdges(
        excludingAnchors: [Anchor]? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            fatalError("Cannot constrain to nil superview")
        }
        return constraint(to: .edges(view: superview), excludingAnchors: excludingAnchors, withInsets: insets)
    }

    /// Constraint edges of the view to its superview layout guide
    ///
    /// - Parameters:
    ///   - excludingAnchors: Anchros that shouldn't be constraint
    ///   - insets: Insets to use, .zero by default
    /// - Returns: Created constraints
    @discardableResult func constraintToSuperviewLayoutGuide(
        excludingAnchors: [Anchor]? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) -> [NSLayoutConstraint] {
        guard let superview = superview else {
            fatalError("Cannot constrain to nil superview")
        }
        return constraint(to: .safeAreaLayout(view: superview), excludingAnchors: excludingAnchors, withInsets: insets)
    }

    /// Constraint edges of the view to given view edges.
    ///
    /// - Parameters:
    ///   - type: a type of layout to use and the view for which to assign it.
    ///   - excludingAnchors: anchors that shouldn't be constraint.
    ///   - insets: insets to use, .zero by default.
    /// - Returns: Created constraints.
    @discardableResult func constraint(to type: ConstraintsType,
        excludingAnchors: [Anchor]? = nil,
        withInsets insets: UIEdgeInsets = .zero
    ) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        if let excludedAnchors = excludingAnchors {
            if !excludedAnchors.contains(.top) {
                constraints.append(topAnchor.constraint(equalTo: type.topAnchor, constant: insets.top))
            }
            if !excludedAnchors.contains(.leading) {
                constraints.append(leadingAnchor.constraint(equalTo: type.leadingAnchor, constant: -insets.right))
            }
            if !excludedAnchors.contains(.bottom) {
                constraints.append(bottomAnchor.constraint(equalTo: type.bottomAnchor, constant: -insets.bottom))
            }
            if !excludedAnchors.contains(.trailing) {
                constraints.append(trailingAnchor.constraint(equalTo: type.trailingAnchor, constant: insets.left))
            }
        } else {
            constraints = [
                topAnchor.constraint(equalTo: type.topAnchor, constant: insets.top),
                leadingAnchor.constraint(equalTo: type.leadingAnchor, constant: insets.left),
                trailingAnchor.constraint(equalTo: type.trailingAnchor, constant: -insets.right),
                bottomAnchor.constraint(equalTo: type.bottomAnchor, constant: -insets.bottom)
            ]
        }
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    /// Constraints width and height anchors to the given constant size.
    ///
    /// - Parameter size: Size to get values from.
    /// - Returns: Created constraints.
    @discardableResult func constraintToConstant(_ size: CGSize) -> [NSLayoutConstraint] {
        let constraints = [
            widthAnchor.constraint(equalToConstant: size.width),
            heightAnchor.constraint(equalToConstant: size.height)
        ]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }

    /// A type of layout for constraints to use.
    enum ConstraintsType {
        case edges(view: UIView), safeAreaLayout(view: UIView)

        /// SeeAlso: `UIView.topAnchor`
        var topAnchor: NSLayoutYAxisAnchor {
            switch self {
            case let .edges(view):
                return view.topAnchor
            case let .safeAreaLayout(view):
                return view.safeAreaLayoutGuide.topAnchor
            }
        }

        /// SeeAlso: `UIView.bottomAnchor`
        var bottomAnchor: NSLayoutYAxisAnchor {
            switch self {
            case let .edges(view):
                return view.bottomAnchor
            case let .safeAreaLayout(view):
                return view.safeAreaLayoutGuide.bottomAnchor
            }
        }

        /// SeeAlso: `UIView.leadingAnchor`
        var leadingAnchor: NSLayoutXAxisAnchor {
            switch self {
            case let .edges(view):
                return view.leadingAnchor
            case let .safeAreaLayout(view):
                return view.safeAreaLayoutGuide.leadingAnchor
            }
        }

        /// SeeAlso: `UIView.trailingAnchor`
        var trailingAnchor: NSLayoutXAxisAnchor {
            switch self {
            case let .edges(view):
                return view.trailingAnchor
            case let .safeAreaLayout(view):
                return view.safeAreaLayoutGuide.trailingAnchor
            }
        }
    }
}

