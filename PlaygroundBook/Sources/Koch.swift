//
//  Koch.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/15.
//

import UIKit
import SpriteKit

class Koch: UIView {
    var lineWidth: CGFloat = 0.5
    var sideLength: CGFloat = 400
    
    var deep: Int = 4
    var color: CGColor
    var isRainBow: Bool = false
    
    var points = [CGPoint]()
    
    var centerP: CGPoint = CGPoint(x: 0, y: 0)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(frame: CGRect, lineWidth: CGFloat, color: UIColor, deep: Int, sideLength: CGFloat, isRainBow: Bool) {
        self.lineWidth = lineWidth > 0 ? lineWidth : 1
        self.color = color.cgColor
        self.deep = deep > 0 ? deep : 1
        self.sideLength = sideLength > 50 ? sideLength : 50
        self.isRainBow = isRainBow
        super.init(frame: frame)
        
        centerP = CGPoint(x: frame.width/2, y: frame.height/2)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let halfSide = sideLength/2
        let A = CGPoint(x: centerP.x - halfSide, y: centerP.y - halfSide * 1.73 / 3)
        let B = CGPoint(x: centerP.x + halfSide, y: centerP.y - halfSide * 1.73 / 3)
        let C = CGPoint(x: centerP.x, y: centerP.y + halfSide * 1.73 * 2/3)
        
        if deep > 1 {
            drawKoch(from: B, to: A, context: context, deep: self.deep)
            drawKoch(from: A, to: C, context: context, deep: self.deep)
            drawKoch(from: C, to: B, context: context, deep: self.deep)
        } else {
            let path = CGMutablePath()
            path.move(to: A)
            path.addLine(to: B)
            path.addLine(to: C)
            path.addLine(to: A)
            context.setStrokeColor(self.isRainBow ? UIColor.randomColor.cgColor : color)
            context.setLineCap(CGLineCap.round)
            context.addPath(path)
            context.setLineWidth(lineWidth)
            context.strokePath()
        }
        
    }
    
    func drawKoch(from: CGPoint, to: CGPoint, context: CGContext, deep: Int) {
        let pathOld = CGMutablePath()
        pathOld.move(to: from)
        pathOld.addLine(to: to)
        context.setStrokeColor((backgroundColor?.cgColor)!)
        context.addPath(pathOld)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        let alpha = atan((to.y - from.y)/(to.x - from.x))
        let L = sqrt((from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y))/3
        
        
        
        let poC = CGPoint(x: from.x + (to.x - from.x)/3, y: from.y + (to.y - from.y)/3)
        var poD: CGPoint
        if to.x < from.x && abs(to.y - from.y) < 1 {
            poD = CGPoint(x: poC.x - cos(alpha + CGFloat(Double.pi/3))*L, y: poC.y + sin(alpha + CGFloat(Double.pi/3))*L - 2*L*CGFloat(sin(Double.pi/3)))
        } else if to.x < from.x && to.y > from.y {
            poD = CGPoint(x: poC.x - cos(alpha + CGFloat(Double.pi/3))*L, y: poC.y + sin(alpha + CGFloat(Double.pi/3))*L)
        } else if to.x < from.x && to.y < from.y {
            poD = CGPoint(x: poC.x - cos(alpha + CGFloat(Double.pi/3))*L, y: poC.y - sin(alpha + CGFloat(Double.pi/3))*L)
        } else {
            poD = CGPoint(x: poC.x + cos(alpha + CGFloat(Double.pi/3))*L, y: poC.y + sin(alpha + CGFloat(Double.pi/3))*L)
        }
        
        let poE = CGPoint(x: from.x + (to.x - from.x) * 2/3, y: from.y + (to.y - from.y) * 2/3)
        
        let path = CGMutablePath()
        path.move(to: from)
        path.addLine(to: poC)
        path.addLine(to: poD)
        path.addLine(to: poE)
        path.addLine(to: to)
        context.setStrokeColor(self.isRainBow ? UIColor.randomColor.cgColor : color)
        context.setLineCap(CGLineCap.round)
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        if deep > 2 {
            drawKoch(from: from, to: poC, context: context, deep: deep - 1)
            drawKoch(from: poC, to: poD, context: context, deep: deep - 1)
            drawKoch(from: poD, to: poE, context: context, deep: deep - 1)
            drawKoch(from: poE, to: to, context: context, deep: deep - 1)
        }
    }
    
    func drawLine(from: CGPoint, to: CGPoint, context: CGContext) {
        let path = CGMutablePath()
        path.move(to: from)
        path.addLine(to: to)
        context.setStrokeColor(color)
        context.setLineCap(CGLineCap.round)
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
    }
}
