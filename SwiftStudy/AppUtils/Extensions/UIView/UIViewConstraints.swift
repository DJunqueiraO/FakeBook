import UIKit

extension UIView {
    var enableAutoLayout: Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
@discardableResult
    func constraint(attribute: NSLayoutConstraint.Attribute,
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        guard let superview = self.superview else {return self}
        superview.addConstraint(NSLayoutConstraint(item: self,
                                                   attribute: attribute,
                                                   relatedBy: relation,
                                                   toItem: item ?? superview,
                                                   attribute: attribute,
                                                   multiplier: multiplier,
                                                   constant: constant ?? 0))
        return self
    }
@discardableResult
    func constraint(attributes: [NSLayoutConstraint.Attribute],
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        guard let superview = self.superview else {return self}
        for attribute in attributes {
            superview.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: attribute,
                                                       relatedBy: relation,
                                                       toItem: item ?? superview,
                                                       attribute: attribute,
                                                       multiplier: multiplier,
                                                       constant: constant ?? 0))
        }
        return self
    }
@discardableResult
    func constraint(attributesAttributes: [NSLayoutConstraint.Attribute:
                                            NSLayoutConstraint.Attribute],
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1,
                    constant: CGFloat? = nil) -> Self {
        guard let superview = self.superview else {return self}
        for attribute in attributesAttributes {
            superview.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: attribute.key,
                                                       relatedBy: relation,
                                                       toItem: item ?? superview,
                                                       attribute: attribute.value,
                                                       multiplier: multiplier,
                                                       constant: constant ?? 0))
        }
        return self
    }
@discardableResult
    func constraint(attributesConstants: [NSLayoutConstraint.Attribute:
                                           CGFloat],
                    to item: Any? = nil,
                    relation: NSLayoutConstraint.Relation = .equal,
                    multiplier: CGFloat = 1) -> Self {
        guard let superview = self.superview else {return self}
        for attribute in attributesConstants {
            superview.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: attribute.key,
                                                       relatedBy: relation,
                                                       toItem: item ?? superview,
                                                       attribute: attribute.key,
                                                       multiplier: multiplier,
                                                       constant: attribute.value))
        }
        return self
    }
}
