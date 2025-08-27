//
//  BallView.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 27.08.2025.
//

import UIKit

class BallView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let ballSize = frame.width / 3.5
        self.frame.size = CGSize(width: ballSize, height: ballSize)
        layer.cornerRadius = ballSize / 2
        
        center.y = frame.height / 3
        center.x = frame.width / 2
        
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpBallColor(_ color: UIColor) {
        backgroundColor = color
    }
    
}
