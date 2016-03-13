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
    @IBOutlet weak var endInMinutesLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    var buttonStyler = MyButtonProperty()
    var timer = NSTimer()
    var repeatCount = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlTimer(true)
        buttonStyler.setupButton(stopButton)
        
    }
    
    func updateLevel(){
        NSLog("timer fired Action")
        NSLog("the count is = \(repeatCount)")
        
        switch repeatCount {
        case 1:
            print("noch 5 Minuten")
            endInMinutesLabel.text = "5"
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
            let fiveMinutes = 60*5
            let timerInterval = NSTimeInterval.init(floatLiteral: Double(fiveMinutes))
            timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector: "updateLevel", userInfo: nil, repeats: true)
        }
    }
    
    func finish(){
        print("finshed is called ...")
        timer.invalidate()
        stopButton.setTitle("Finish", forState: UIControlState.Normal)
        endInLabel.text = "that's all! finshed."
        endInMinutesLabel.text = "🏁"
//        endInMinutesLabel.hidden = true
    }
    
    @IBAction func stopAction() {
        timer.invalidate()
        endInLabel.hidden = true
        endInMinutesLabel.hidden = true
    }
    
}