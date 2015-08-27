//
//  ViewController.swift
//  TestingSegues
//
//  Created by Travis.Emery on 8/24/15.
//  Copyright (c) 2015 emery. All rights reserved.
//

import UIKit

class ViewController: UIViewController,SecondViewDelegate {

    @IBOutlet weak var one: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func myVCDidFinish(controller: SecondView, text: String) {
        one.text = "The Color is " +  text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as! SecondView
            vc.colorString = one.text!
            vc.delegate = self
        }
    }

}

