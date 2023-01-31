//
//  ViewController.swift
//  Calculator
//
//  Created by MAC on 22.01.2023.
//

import UIKit

class CalculatorViewController: UIViewController {

    private let calculatorView = CalculatorView()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.textAlignment = .right
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierarchy()
        setupLayout()
    }

    private func setupHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(calculatorView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: calculatorView.topAnchor, constant: -10),

            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            calculatorView.heightAnchor.constraint(equalTo: calculatorView.widthAnchor, multiplier: 1)
        ])
    }
}
