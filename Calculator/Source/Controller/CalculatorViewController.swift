//
//  ViewController.swift
//  Calculator
//
//  Created by MAC on 22.01.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    let calculatorView = CalculatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(calculatorView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            calculatorView.heightAnchor.constraint(equalTo: calculatorView.widthAnchor, multiplier: 1)
        ])
    }
}
