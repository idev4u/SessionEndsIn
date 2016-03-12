//
//  ActionViewController.swift
//  SessionEndsIn
//
//  Created by Norman Sutorius on 12.03.16.
//  Copyright © 2016 Norman Sutorius. All rights reserved.
//

import UIKit
import Foundation

class ActionViewController: UIViewController {
    
    @IBOutlet weak var EndInLabel: UILabel!
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "updateLevel", userInfo: nil, repeats: true)
        
    }
    
    func updateLevel(){
        NSLog("timer fired Action")
        
    }
    
    
    @IBAction func stopAction() {
        timer.invalidate()
        EndInLabel.text = "Reset"
    }
    
}