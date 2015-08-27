//
//  ShapeView.swift
//  GestureRecognizer
//
//  Created by Travis.Emery on 8/27/15.
//  Copyright (c) 2015 emery. All rights reserved.
//

import UIKit

class ShapeView: UIView{
    let size: CGFloat = 150.0
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        
        UIColor.redColor().setFill()
        path.fill()
        
    }
    
    init(origin: CGPoint) {
        super.init(frame: CGRectMake(0.0, 0.0, size, size))
        self.center = origin
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}