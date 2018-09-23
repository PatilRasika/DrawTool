//
//  DrawView.swift
//  DrawTool
//
//  Created by Rasika Patil
//  Copyright © 2018 Rasika Patil. All rights reserved.
//

import UIKit

class DrawView : UIView{
    
    var lines: [Line] = []
    var lastPoint: CGPoint!
    
    required init(coder aDecoder :NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.locationInView(self)
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first{
            let newPoint = touch.locationInView(self)
            lines.append(Line(start: lastPoint, end: newPoint))
            lastPoint = newPoint
        }
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines{
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetLineCap(context, CGLineCap.Round)
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    }
    

}