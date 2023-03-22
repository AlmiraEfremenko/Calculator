//
//  CalculationModel.swift
//  Calculator
//
//  Created by MAC on 05.03.2023.
//

import Foundation

class CalculationModel {
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction

    public func setNumber(number: Int) {

        // например нажали 0 и потом 1 - нужно удалить первый элемент если он 0
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        }
        // удалить последний элемент если несколько раз нажали 0
        if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }
        currentNumber.append(String(number))
    }

    public func getCurrentNumber() -> String {
        return currentNumber.stringWithPoint
    }

    //MARK: функция настройки операции, если мы можем получить число из currentNumber то это число мы записываем в firstNumber, обнуляем currentNumber и currentOperation = operation(операции - + = * /)

    public func setOperations(operation: Operations) -> String {

        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return "" }
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else { return "" }
            firstNumber = result
        }
        currentNumber = ""
        currentOperation = operation
        return firstNumber.stringWithoutZeroFraction.stringWithPoint
    }

    public func getResult() -> String {
        // Для получения результата операции - необходимо узнать secondNumber

        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number

        var result = 0.0
        switch currentOperation {

        case .noAction:
            return currentNumber
        case .addition:
            result = firstNumber + secondNumber
        case .substraction:
            result = firstNumber - secondNumber
        case .multiplication:
            result = firstNumber * secondNumber
        case .division:

            if secondNumber == 0 {
                return "Не определено"
            } else {
                result = firstNumber / secondNumber
            }
        }
        return result.stringWithoutZeroFraction.stringWithPoint
    }

    // Сброс значений
    public func resetValue() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
    }

    public func invertValue() {
        guard let number = Double(currentNumber) else {
            currentNumber = "0"
            return }

        switch number {
        case ..<0:
            currentNumber.remove(at: currentNumber.startIndex)
        case 0: break
        case 0...:
            currentNumber.insert("-", at: currentNumber.startIndex)
        default:
            print("error")
        }
    }

    public func addPointValue() {

        if !currentNumber.contains(".") {
            currentNumber += currentNumber != "" ? "." : "0."
        }
    }

    public func setPercent() {
        guard let number = Double(currentNumber) else { return }

        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
