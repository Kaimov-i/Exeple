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
    private let imageView = UIImageView()
    private let imageContainerView = UIView()
    private let stackView = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
        setupImageContainerView()
        setupImgae()
        setupView()
        setupStackView()
        view.addSubview(stackView)
        setupLayout()
        
        
        
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first
        textLabel.text = "\(firstNumber ?? 0)"
        textLabel.font = .systemFont(ofSize: 30, weight: .bold)
        textLabel.textAlignment = .center
        textLabel.textColor = .red
    }
    
    private func setupImageContainerView() {
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 10
        imageContainerView.addSubview(imageView)
    }
    
    private func setupImgae() {
        imageView.image = UIImage(named: "priroda")
        imageView.frame = imageContainerView.bounds
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 1)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
           
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 400),
          
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(imageContainerView)
    }
    
    private func updateNumbers() {
        helper.addNumer(Int.random(in: 1...10))
    }
}

