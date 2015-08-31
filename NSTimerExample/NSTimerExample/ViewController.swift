//
//  ViewController.swift
//  NSTimerExample
//
//  Created by Travis.Emery on 8/29/15.
//  Copyright (c) 2015 emery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var timer       = NSTimer()
    var binaryCount = 0b0000 // binary representation of 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startAction(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "countUp", userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func resetAction(sender: AnyObject) {

        timer.invalidate()
        binaryCount = 0b0000
        
        updateText()
    
    }
    
    func countUp(){
 
        binaryCount += 0b0001
        
        // if the counter reached 16, reset it to 0
        if (binaryCount == 0b10000) {
            binaryCount = 0b0000
        }
        
        updateText()
        
    }
    
    func updateText(){
 
        // Convert from Binary to String
        var text = String(binaryCount, radix:2)
        
        // Pad "0" to the left, to always have 4 binary digits
        for i in 0..<4 - count(text) {
            text = "0" + text;
        }
        
        timerLabel.text = text
        
    }
}

