//
//  MyButtonProperty.swift
//  SessionEndsIn
//
//  Created by Norman Sutorius on 13.03.16.
//  Copyright © 2016 Norman Sutorius. All rights reserved.
//
import UIKit
import Foundation

class MyButtonProperty {
   
    func setupButton(button: UIButton) -> (UIButton){
    button.layer.cornerRadius = 100/2
//    let swiftColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1).CGColor
    let swiftColor = UIColor.redColor().CGColor;
    button.layer.borderColor=swiftColor
    button.layer.borderWidth=2
    return button
    }
    
}