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
    
   
    @IBOutlet weak var endInLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    var timer = NSTimer()
    var repeatCount = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlTimer(true)
        
    }
    
    func updateLevel(){
        NSLog("timer fired Action")
        NSLog("the count is = \(repeatCount)")
        
        switch repeatCount {
        case 1:
            print("noch 5 Minuten")
            endInLabel.text = "Noch 5 Minuten"
        case 2:
            print("that's all! finshed.")
            finish()
        default:
            print("Something else")
        }
        
        
        repeatCount++
        
        
    }
    
    func controlTimer(repeats: Bool){
        if(repeats){
            timer = NSTimer.scheduledTimerWithTimeInterval(10.0, target: self, selector: "updateLevel", userInfo: nil, repeats: true)
        }
    }
    
    func finish(){
        print("finshed is called ...")
        timer.invalidate()
        stopButton.setTitle("Finish", forState: UIControlState.Normal)
        endInLabel.text = "that's all! finshed."
    }
    
    @IBAction func stopAction() {
        timer.invalidate()
        endInLabel.text = "Reset"
    }
    
}