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
    @IBOutlet weak var progressBar: UIProgressView!
    var buttonStyler = MyButtonProperty()
    var timer = NSTimer()
    var repeatCount = 1
    var progressCount = 600
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlTimer(true)
        progressBar.setProgress(Float(progressCount), animated: true)
        buttonStyler.setupButton(stopButton)
        
    }
    
    func updateLevel(){
        NSLog("timer fired Action")
        NSLog("the count is = \(repeatCount)")
        
        switch repeatCount {
        case 300:
            print("noch 5 Minuten")
            endInMinutesLabel.text = "5"
        case 600:
            print("that's all! finshed.")
            finish()
        default:
            print("progres Count \(progressCount)")
            
        }
        progressCount -= 1
        progressBar?.progress -= 0.001
        repeatCount+=1
        
        
    }
    
    func controlTimer(repeats: Bool){
        if(repeats){
            let seconds = 1
//            let fiveMinutes = 5
            let timerInterval = NSTimeInterval.init(floatLiteral: Double(seconds))
            timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval, target: self, selector: #selector(ActionViewController.updateLevel), userInfo: nil, repeats: true)
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