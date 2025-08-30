//
//  ArrowButton.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 30.08.2025.
//

import UIKit

class ArrowButtons: UIView {
    
    weak var delegate: ButtonDelegate?
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        guard let superview = superview else { return }
        
        let HStack = UIStackView()
        HStack.axis = .horizontal
        HStack.distribution = .equalSpacing
        
        HStack.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(HStack)
        
        NSLayoutConstraint.activate([
            HStack.bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor),
            HStack.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 16),
            HStack.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -16)
        ])
        
        for direction in ButtonDirection.allCases {
            let button = UIButton()
            let buttonSize = superview.frame.width / 4
            button.setTitle(direction.rawValue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: buttonSize)
            
            
            if direction != ButtonDirection.up {
                HStack.addArrangedSubview(button)
            } else {
                button.translatesAutoresizingMaskIntoConstraints = false
                superview.addSubview(button)
                
                NSLayoutConstraint.activate([
                    button.bottomAnchor.constraint(equalTo: HStack.topAnchor),
                    button.centerXAnchor.constraint(equalTo: HStack.centerXAnchor)
                ])
            }
            
            button.addTarget(self, action: #selector(sendDirection(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func sendDirection(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              let direction = ButtonDirection(rawValue: title) else { return }
        
        switch direction {
        case .up :
            self.delegate?.getDirection(direction: .up)
        case .left :
            self.delegate?.getDirection(direction: .left)
        case .down :
            self.delegate?.getDirection(direction: .down)
        case .right :
            self.delegate?.getDirection(direction: .right)
        }
    }
    
}
