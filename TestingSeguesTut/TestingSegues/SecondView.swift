//
//  SecondView.swift
//  TestingSegues
//
//  Created by Travis.Emery on 8/24/15.
//  Copyright (c) 2015 emery. All rights reserved.
//

import UIKit

protocol SecondViewDelegate{
    func myVCDidFinish(controller:SecondView,text:String)
}

class SecondView: UIViewController{
    
    var delegate:SecondViewDelegate? = nil
    var colorString = ""
    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBAction func saveColor(sender: UIBarButtonItem) {
    
        if (delegate != nil) {
            delegate!.myVCDidFinish(self, text: colorLabel!.text!)
        }
    }

    @IBAction func colorSelectionButton(sender: UIButton) {
        colorLabel.text = sender.titleLabel!.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = colorString
    }
    
}
