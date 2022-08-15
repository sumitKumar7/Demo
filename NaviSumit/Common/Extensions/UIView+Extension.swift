//
//  UIView+Extension.swift
//  NaviSumit
//
//  Created by Sumit Kumar on 15/08/22.
//

import UIKit

extension UIView {
    
    func addCorner(with radius: CGFloat,
                   borderColor: UIColor? = nil,
                   borderWidth: CGFloat = 0) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
    }
}
