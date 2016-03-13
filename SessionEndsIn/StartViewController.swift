//
//  StartView.swift
//  SessionEndsIn
//
//  Created by Norman Sutorius on 12.03.16.
//  Copyright © 2016 Norman Sutorius. All rights reserved.
//

import UIKit
import Foundation

class StartViewController: UIViewController{
    
    @IBOutlet weak var startButton: UIButton!
    var buttonStyler = MyButtonProperty()
    override func viewDidLoad() {
        super.viewDidLoad()
//        UIApplication.sharedApplication().statusBarStyle = .LightContent
        UIApplication.sharedApplication().idleTimerDisabled = true
        buttonStyler.setupButton(startButton)
    }
    
}
