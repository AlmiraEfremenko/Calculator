//
//  Double + Ext.swift
//  Calculator
//
//  Created by MAC on 22.03.2023.
//

import Foundation

extension Double {

    var stringWithoutZeroFraction: String {
        // если остаток от деления равен 0 - то мы отбрасываем дробную часть. Если не равен 0 - то возвращаем дробную часть но конвертнули в String
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
