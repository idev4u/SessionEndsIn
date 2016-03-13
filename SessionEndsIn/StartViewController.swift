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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton();
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupButton(){
        startButton.layer.cornerRadius = 100/2
        let swiftColor = UIColor(red: 0, green: 122/255, blue: 1, alpha: 1).CGColor
        startButton.layer.borderColor=swiftColor
        startButton.layer.borderWidth=1
    }
   
}
