//
//  DirectionDelegate.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 30.08.2025.
//

import UIKit

protocol DirectionDelegate: AnyObject {
    
    func getDirectionAndMoveBall(direction: ArrowButtons.ButtonDirection, sender: UIButton)
    
}
