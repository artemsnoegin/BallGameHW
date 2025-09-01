//
//  ViewController.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 27.08.2025.
//

import UIKit

class ViewController: UIViewController, DirectionDelegate {
    
    private let ballView = UIView()
    private let ballSize: CGFloat = 100
    private let arrowButtons = ArrowButtons()
    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addBallOnView()
    }
    
    private func setUpLayout() {
        view.backgroundColor = .systemGray6
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 25
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        arrowButtons.delegate = self
        arrowButtons.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(arrowButtons)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: arrowButtons.topAnchor),
            
            arrowButtons.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            arrowButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            arrowButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            arrowButtons.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    private func addBallOnView() {
        ballView.frame = CGRect(
            x: (containerView.bounds.width - ballSize) / 2,
            y: (containerView.bounds.height - ballSize) / 2,
            width: ballSize,
            height: ballSize)
        ballView.layer.cornerRadius = ballSize / 2
        ballView.backgroundColor = .systemRed
        containerView.addSubview(ballView)
    }
    
    func getDirectionAndMoveBall(direction: ArrowButtons.ButtonDirection, sender: UIButton) {
        let ballRadius = ballSize / 2
        
        let topBoarder = ballRadius
        let leftBoarder = ballRadius
        let rightBoarder = containerView.bounds.width - ballRadius
        let bottomBoarder = containerView.bounds.height - ballRadius
        
        let step: CGFloat = self.ballSize
        
        var destination: CGFloat = 0
        
        sender.isEnabled = false

        UIView.animateKeyframes(withDuration: 0.4, delay: 0, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1) {
                switch direction {
                case .up:
                    destination = self.ballView.center.y - step
                    if destination > topBoarder {
                        self.ballView.center.y = destination
                    }
                case .left:
                    destination = self.ballView.center.x - step
                    if destination > leftBoarder {
                        self.ballView.center.x = destination
                    }
                case .right:
                    destination = self.ballView.center.x + step
                    if destination < rightBoarder {
                        self.ballView.center.x = destination
                    }
                case .down:
                    destination = self.ballView.center.y + step
                    if destination < bottomBoarder {
                        self.ballView.center.y = destination
                    }
                }
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                    self.ballView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.ballView.transform = .identity
            }
            
        }) { _ in
            sender.isEnabled = true
        }
    }
    
}

