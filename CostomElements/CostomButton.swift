//
//  CostomButton.swift
//  EvgenyaBuykoWorkProject
//
//  Created by Ilman on 31.08.2025.
//

import UIKit

class CostomButton: UIButton {
    init(textButton: String, bgColor: UIColor) {
        super.init(frame: .zero)
        
        setupButton(text: textButton, bgColor: bgColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CostomButton {
    enum Constant {
        static let cornerRadius: CGFloat = 10
    }
}

extension CostomButton {
    private func setupButton(text: String, bgColor: UIColor) {
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = CostomButton.Constant.cornerRadius
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

