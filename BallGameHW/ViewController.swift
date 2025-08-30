//
//  ViewController.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 27.08.2025.
//

import UIKit

class ViewController: UIViewController, ButtonDelegate {
    
    private let ball = BallView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        ball.frame = view.frame
        view.addSubview(ball)
        
        let buttons = ArrowButtons()
        buttons.delegate = self
        view.addSubview(buttons)
    }
    
    func getDirection(direction: ButtonDirection) {
        guard let step = ball.ballSize else { return }
            
        UIView.animate(withDuration: 0.5, animations: {
            switch direction {
            case .up :
                self.ball.center.y -= step
                

            case .left :
                self.ball.center.x -= step
                
            case .down :
                self.ball.center.y += step
                
            case .right :
                self.ball.center.x += step
                
            }
        })
    }
    
}

