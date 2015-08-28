//
//  ShapeView.swift
//  GestureRecognizer
//
//  Created by Travis.Emery on 8/27/15.
//  Copyright (c) 2015 emery. All rights reserved.
//
//  This class represents the square including size and color

import UIKit

class ShapeView: UIView{
    
    
    //Fields
    let size: CGFloat = 50.0 //overall size of the squares
    let lineWidth: CGFloat = 3 // the stroke 
    
    
    //Added Methods
    init(origin: CGPoint) {
        
        //Build the square
        super.init(frame: CGRectMake(0.0, 0.0, size, size))
        self.center = origin
        self.backgroundColor = UIColor.clearColor()//This removes the black corners on the squares
        
        //Init the gestures defined in this method
        initGestureRecognizers()
    }
    
    /*
        Gesture Recognition
    */
    func initGestureRecognizers() {
        
        //Panning Gesture
        let panGR = UIPanGestureRecognizer(target: self, action: "didPan:")
        addGestureRecognizer(panGR)
        
        //Pinching gesture
        let pinchGR = UIPinchGestureRecognizer(target: self, action: "didPinch:")
        addGestureRecognizer(pinchGR)
        
    }
    
    /*
        Function for moving shapes around on teh view
    */
    func didPan(panGR: UIPanGestureRecognizer) {
        
        self.superview!.bringSubviewToFront(self)
        
        var translation = panGR.translationInView(self)
        
        self.center.x += translation.x
        self.center.y += translation.y
        
        panGR.setTranslation(CGPointZero, inView: self)
    }
    
    func didPinch(pinchGR: UIPinchGestureRecognizer) {
        
        self.superview!.bringSubviewToFront(self)
        
        let scale = pinchGR.scale
        
        self.transform = CGAffineTransformScale(self.transform, scale, scale)
        
        pinchGR.scale = 1.0
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Overridden methods
    override func drawRect(rect: CGRect) {
        
        let insetRect = CGRectInset(rect, lineWidth / 2, lineWidth / 2)
        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: 10)
       
        UIColor.redColor().setFill()
        path.fill()
        
        path.lineWidth = self.lineWidth
        UIColor.blackColor().setStroke()
        path.stroke()

    }

}