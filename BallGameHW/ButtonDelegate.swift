//
//  ButtonDelegate.swift
//  BallGameHW
//
//  Created by Артём Сноегин on 30.08.2025.
//

import UIKit

protocol ButtonDelegate: AnyObject {
    
    func getDirection(direction: ButtonDirection)
    
}
