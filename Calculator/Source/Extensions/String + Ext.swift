//
//  String + Ext.swift
//  Calculator
//
//  Created by MAC on 22.03.2023.
//

import Foundation

extension String {

    var stringWithPoint: String {
        // Если строка содержит точку то заменить точку на запятую
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
