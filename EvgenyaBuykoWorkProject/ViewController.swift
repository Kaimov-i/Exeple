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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        updateNumbers()
        
        setupLabel()
        view.addSubview(textLabel)
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
    private func updateNumbers() {
        helper.addNumer(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
}

