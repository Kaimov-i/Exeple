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
    private let shadowView = ShadowView(imageName: ShadowViewType.priroda.rawValue)
    private let stackView = UIStackView()
    private let numberButton = CostomButton(textButton: "Change number", bgColor: .systemRed)
    private let imageButton = CostomButton(textButton: "Change image", bgColor: .systemGreen)
    private let isOnPriroda = true
    
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
        addAction()
        setupLayout()
    }
    
    private func updateNumbers() {
        helper.addNumer(randomNumber)
        helper.addNumer(randomNumber)
        helper.addNumer(randomNumber)
        helper.addNumer(randomNumber)
        helper.addNumer(randomNumber)
        helper.addNumer(randomNumber)
    }
    
    @objc private func numberButtonTapped() {
        textLabel.text = helper.getRanomNumber().formatted()
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
    func addAction() {
        numberButton.addTarget(
            self,
            action: #selector(numberButtonTapped),
            for: .touchUpInside
        )
        
        let action = UIAction { _ in
            guard let randomImageName = [ShadowViewType.road.rawValue, ShadowViewType.priroda.rawValue].randomElement() else { return }
            
            self.shadowView.updateImage(randomImageName)
        }
        
        imageButton.addAction(action, for: .touchUpInside)
        
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 20
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(shadowView)
        stackView.addArrangedSubview(numberButton)
        stackView.addArrangedSubview(imageButton)
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
            
            shadowView.heightAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
}

