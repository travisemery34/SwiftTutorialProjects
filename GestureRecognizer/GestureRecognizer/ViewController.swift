//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Travis.Emery on 8/27/15.
//  Copyright (c) 2015 emery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func didTap(tapGR: UITapGestureRecognizer) {
        
        let tapPoint = tapGR.locationInView(self.view)
        
        let shapeView = ShapeView(origin: tapPoint)
        
        self.view.addSubview(shapeView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tapGR = UITapGestureRecognizer(target: self, action: "didTap:")
        self.view.addGestureRecognizer(tapGR)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

