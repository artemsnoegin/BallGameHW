//
//  ArrowButtons.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 30.08.2025.
//

import UIKit

class ArrowButtons: UIView {
    
    weak var delegate: ButtonDelegate?
    
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
        
        let VStack = UIStackView()
        VStack.axis = .vertical
        VStack.distribution = .equalSpacing
        VStack.backgroundColor = .white
        VStack.layer.cornerRadius = 25
        
        VStack.addArrangedSubview(HStack)
        VStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(VStack)
        
        NSLayoutConstraint.activate([
            VStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            VStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            VStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            VStack.heightAnchor.constraint(equalToConstant: 220),
            
            HStack.leadingAnchor.constraint(equalTo: VStack.leadingAnchor, constant: 22),
            HStack.trailingAnchor.constraint(equalTo: VStack.trailingAnchor, constant: -22),
        ])
        
        for direction in ButtonDirection.allCases {
            let button = UIButton()
            button.setTitle(direction.rawValue, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 80)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            if direction != ButtonDirection.up {
                HStack.addArrangedSubview(button)
            } else {
                VStack.insertArrangedSubview(button, at: 0)
            }
            
            button.addTarget(self, action: #selector(sendDirection(_:)), for: .touchUpInside)
        }
    }
    
    @objc private func sendDirection(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              let direction = ButtonDirection(rawValue: title) else { return }
        
        delegate?.getDirection(direction: direction)
    }
    
}
