//
//  ViewController.swift
//  Calculator
//
//  Created by MAC on 22.01.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.textAlignment = .right
        return label
    }()

    let calculatorView = CalculatorView()
    let calculationModel = CalculationModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
        setDelegates()
    }

    private func setupHierarchy() {
        view.addSubview(resultLabel)
        view.addSubview(calculatorView)
    }

    private func setDelegates() {
        calculatorView.delegate = self
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([

            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            resultLabel.bottomAnchor.constraint(equalTo: calculatorView.topAnchor, constant: -10),

            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            calculatorView.heightAnchor.constraint(equalTo: calculatorView.widthAnchor, multiplier: 1)
        ])
    }
}

extension CalculatorViewController: CalculatorViewProtocol {
    func tapNumberButton(tag: Int) {
        calculationModel.setNumber(number: tag)
        resultLabel.text = calculationModel.getCurrentNumber()
    }

    func tapActionButton(tag: Int) {

        switch tag {
        case 10: // ,
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 11: // =
            resultLabel.text = calculationModel.getResult()
        case 12: // +
            resultLabel.text = calculationModel.setOperations(operation: .addition)
        case 13: // -
            resultLabel.text = calculationModel.setOperations(operation: .substraction)
        case 14: // *
            resultLabel.text = calculationModel.setOperations(operation: .multiplication)
        case 15: // /
            resultLabel.text = calculationModel.setOperations(operation: .division)
        case 16: // %
            calculationModel.setPercent()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 17: //  - +
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getCurrentNumber()
        case 18: // AC
            calculationModel.resetValue()
            resultLabel.text = "0"
        default:
            print("error tap")
        }
    }
}
