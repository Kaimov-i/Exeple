//
//  Helper.swift
//  EvgenyaBuykoWorkProject
//
//  Created by Ilman on 02.08.2025.
//

import Foundation

class Helper {
    private var numbers: [Int] = []
    
    func addNumer(_ number: Int) {
        numbers.append(number)
    }
    
    func getNumbers() -> [Int] {
        numbers
    }
}
