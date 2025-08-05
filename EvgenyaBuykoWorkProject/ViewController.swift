//
//  ViewController.swift
//  EvgenyaBuykoWorkProject
//
//  Created by Ilman on 29.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var helper = Helper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNumbers()
    }
    
    private func updateNumbers() {
        helper.addNumer(Int.random(in: 1...10))
        
        for number in helper.getNumbers() {
            print(number)
        }
    }
}

