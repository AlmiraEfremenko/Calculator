//
//  UIStackView+Ext.swift
//  Calculator
//
//  Created by MAC on 22.01.2023.
//

import UIKit

extension UIStackView {

    convenience init(views: [UIView]) {
        self.init(arrangedSubviews: views)
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.spacing = 1
    }
}
