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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
        setupImgae()
        setupView()
        view.addSubview(textLabel)
        view.addSubview(imageView)
    }
    
    private func setupLabel() {
        let firstNumber = helper.getNumbers().first ?? 0
        
        let atributeString = NSMutableAttributedString(string: firstNumber.formatted())
        atributeString.addAttributes([
            .font: UIFont.systemFont(ofSize: 30, weight: .bold),
            .foregroundColor: UIColor.red], range: NSRange(location: 0, length: 0))
        textLabel.attributedText = atributeString
        textLabel.frame = CGRect(x: 30, y: 30, width: 100, height: 50)
    }
    
    private func setupImgae() {
        imageView.image = UIImage(named: "priroda")
        imageView.frame = CGRect(x: 30, y: 130, width: 100, height: 200)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
    }
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func updateNumbers() {
        helper.addNumer(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
}

