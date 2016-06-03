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
    @IBOutlet weak var countdownTime: UILabel!
    var buttonStyler = MyButtonProperty()
    var timer = NSTimer()
    var repeatCount = 1
    var progressCount = 600
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controlTimer(true)
        progressBar.setProgress(Float(progressCount), animated: true)
        buttonStyler.setupButton(stopButton)
        countdownTime.textColor = UIColor.redColor();
        countdownLabel(progressCount)
//        let(m,s) = secondsToMinutesSeconds(progressCount)
//        countdownTime.text = "\(numberOfDigits(m)):\(numberOfDigits(s))"
        
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
        progressBar?.progress -= 0.00166666666667
        countdownLabel(progressCount)
//        let(m,s) = secondsToMinutesSeconds(progressCount)
//        countdownTime.text = "\(numberOfDigits(m)):\(numberOfDigits(s))"
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
    
    func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
        return (seconds % 3600 / 60, (seconds % 3600) % 60)
    }
    func numberOfDigits(digit: Int) -> (String){
        if digit < 10 {
            return "0\(digit)"
        } else {
            return "\(digit)"
        }
        
    }
    
    func countdownLabel(progressTime : Int){
        let(m,s) = secondsToMinutesSeconds(progressCount)
        countdownTime.text = "\(numberOfDigits(m)):\(numberOfDigits(s))"
    }
}