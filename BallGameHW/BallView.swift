//
//  BallView.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 27.08.2025.
//

import UIKit

class BallView: UIView {
    
    var ballSize: CGFloat = 0
    
    override func didMoveToSuperview() {
        guard let superview = superview else { return }

        ballSize = superview.frame.width / 4
        
        frame.size = CGSize(width: ballSize, height: ballSize)
        layer.cornerRadius = ballSize / 2
        
        center.y = superview.frame.height / 3
        center.x = superview.frame.width / 2
        
        backgroundColor = .systemRed
    }

}
