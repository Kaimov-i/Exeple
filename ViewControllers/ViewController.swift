//
//  ViewController.swift
//  EvgenyaBuykoWorkProject
//
//  Created by Ilman on 29.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let helper = Helper()
    
    private let textLabel = UILabel()
    private let shadowImage = ShadowView(imageName: ShadowViewType.priroda.rawValue)
    private let seconShadowImage = ShadowView(imageName: ShadowViewType.road.rawValue)
    private let stackView = UIStackView()
    
    private var randomNumber: Int {
        Int.random(in: 1...10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
        
        view.addGradient()
        setupLabel()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumer(randomNumber)
    }
}

// MARK: - Nested types
extension ViewController {
    
    enum ShadowViewType: String {
        case priroda = "priroda"
        case road = "road2"
    }
    
    enum Constant {
        static let font30: CGFloat = 30
    }
}

// MARK: - Setup View
private extension ViewController {
    
     func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowImage)
        stackView.addArrangedSubview(seconShadowImage)
    }
    
     func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: Constant.font30, weight: .bold)
        textLabel.textAlignment = .center
        textLabel.textColor = .red
    }
    
}

// MARK: - Setup Layout
extension ViewController {
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
}

