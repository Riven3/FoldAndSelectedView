//
//  UIView+Extension.swift
//  SelectFoldView
//
//  Created by 金劲通 on 2021/8/12.
//

import UIKit

extension UIView {
    public func setShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        layoutIfNeeded()
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowColor = color.cgColor
        if let r = cornerRadius {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath
        }
    }
}
