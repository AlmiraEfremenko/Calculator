//
//  CalcutatorView.swift
//  Calculator
//
//  Created by MAC on 22.01.2023.
//

import UIKit

class CalculatorView: UIStackView {

    var parentStackView = [UIStackView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCalculatorStackView()
        configure()
        parentStackView.forEach{addArrangedSubview($0)}
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        axis = .vertical
        spacing = 1
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func createButton(title: String, tag: Int, color: UIColor) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        button.tag = tag
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        return button
    }

    @objc private func tapButton() {

    }

    private func setupCalculatorStackView() {
        let buttonZero = createButton(title: "0", tag: 0, color: .gray)
        let buttonComma = createButton(title: ",", tag: 10, color: .gray)
        let buttonEqual = createButton(title: "=", tag: 11, color: .orange)

        let firstStackView = UIStackView(views: [buttonZero, buttonComma, buttonEqual])
        buttonZero.widthAnchor.constraint(equalTo: firstStackView.widthAnchor, multiplier: 0.5).isActive = true
        buttonComma.widthAnchor.constraint(equalTo: buttonEqual.widthAnchor, multiplier: 1).isActive = true
        firstStackView.distribution = .fill

        let buttonOne = createButton(title: "1", tag: 1, color: .gray)
        let buttonTwo = createButton(title: "2", tag: 2, color: .gray)
        let buttonThree = createButton(title: "3", tag: 3, color: .gray)
        let buttonPlus = createButton(title: "+", tag: 12, color: .orange)

        let secondStackView = UIStackView(views: [buttonOne, buttonTwo, buttonThree, buttonPlus])

        let buttonFour = createButton(title: "4", tag: 4, color: .gray)
        let buttonFive = createButton(title: "5", tag: 5, color: .gray)
        let buttonSix = createButton(title: "6", tag: 5, color: .gray)
        let buttonMinus = createButton(title: "-", tag: 13, color: .orange)

        let thirdStackView = UIStackView(views: [buttonFour, buttonFive, buttonSix, buttonMinus])

        let buttonSeven = createButton(title: "7", tag: 7, color: .gray)
        let buttonEight = createButton(title: "5", tag: 5, color: .gray)
        let buttonNine = createButton(title: "6", tag: 5, color: .gray)
        let buttonMultiply = createButton(title: "X", tag: 14, color: .orange)

        let fourStackView = UIStackView(views: [buttonSeven, buttonEight, buttonNine, buttonMultiply])

        let buttonAC = createButton(title: "AC", tag: 18, color: .lightGray)
        let buttonPlusMinus = createButton(title: "+/-", tag: 17, color: .lightGray)
        let buttonPersent = createButton(title: "%", tag: 16, color: .lightGray)
        let buttonDevide = createButton(title: "/", tag: 15, color: .orange)

        let fiveStackView = UIStackView(views: [buttonAC, buttonPlusMinus, buttonPersent, buttonDevide])

        parentStackView = [fiveStackView, fourStackView, thirdStackView, secondStackView, firstStackView]
    }
}
