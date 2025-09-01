//
//  ArrowButtons.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 30.08.2025.
//

import UIKit

class ArrowButtons: UIView {
    
    enum ButtonDirection: String, CaseIterable {
        case up = "⬆️"
        case left = "⬅️"
        case down = "⬇️"
        case right = "➡️"
    }
    
    weak var delegate: DirectionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButtons() {
        let HStack = UIStackView()
        HStack.axis = .horizontal
        HStack.distribution = .equalSpacing
        
        HStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(HStack)
        
        NSLayoutConstraint.activate([
            HStack.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            HStack.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -152),
            HStack.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 152),
        ])
        
        for direction in ButtonDirection.allCases {
            let button = UIButton(type: .system)
            button.setTitle(direction.rawValue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 80)
            
            if direction != ButtonDirection.up {
                HStack.addArrangedSubview(button)
            } else {
                button.translatesAutoresizingMaskIntoConstraints = false
                addSubview(button)
                
                NSLayoutConstraint.activate([
                    button.centerXAnchor.constraint(equalTo: centerXAnchor),
                    button.bottomAnchor.constraint(equalTo: HStack.topAnchor)
                ])

            }
            
            button.addTarget(self, action: #selector(sendDirection(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func sendDirection(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              let direction = ButtonDirection(rawValue: title) else { return }
        
        delegate?.getDirectionAndMoveBall(direction: direction)
    }
    
}
