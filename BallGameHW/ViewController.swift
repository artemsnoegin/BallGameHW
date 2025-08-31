//
//  ViewController.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 27.08.2025.
//

import UIKit

class ViewController: UIViewController, ButtonDelegate {
    
    private let ball = BallView()
    private let buttons = ArrowButtons()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray6
        
        ball.frame = view.frame
        view.addSubview(ball)
        
        buttons.delegate = self
        buttons.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttons)
        
        NSLayoutConstraint.activate([
            buttons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttons.heightAnchor.constraint(equalToConstant: 220)
        ])
        
    }
    
    func getDirection(direction: ButtonDirection) {
        let step: CGFloat = self.ball.ballSize
        
        var destination: CGFloat = 0
        
        var boarder: CGFloat = 0
            
        UIView.animate(withDuration: 0.5, animations: {
            switch direction {
            case .up :
                destination = self.ball.center.y - step
                boarder = self.view.safeAreaInsets.top + self.ball.ballSize / 2
                if destination > boarder {
                    self.ball.center.y -= step
                }

            case .left :
                destination = self.ball.center.x - step
                boarder = self.ball.ballSize / 2
                
                if destination > boarder {
                    self.ball.center.x -= step
                }
                
            case .down :
                destination = self.ball.center.y + step
                boarder = self.view.frame.height - self.view.safeAreaInsets.bottom - self.buttons.frame.height - self.ball.ballSize / 2
                
                if destination < boarder {
                    self.ball.center.y = destination
                }
                
            case .right :
                destination = self.ball.center.x + step
                boarder = self.view.frame.width - self.ball.ballSize / 2
                
                if destination < boarder {
                    self.ball.center.x += step
                }
            }
        })
    }
    
}

