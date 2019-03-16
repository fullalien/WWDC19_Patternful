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
    
    var deep: Int = 4
    var color: CGColor
    
    var points = [CGPoint]()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(frame: CGRect, lineWidth: CGFloat, color: UIColor, deep: Int) {
        self.lineWidth = lineWidth
        self.color = color.cgColor
        self.deep = deep
        super.init(frame: frame)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        drawKoch(from: CGPoint(x: 0, y: 100), to: CGPoint(x: 400, y: 100), context: context, deep: self.deep)
    }
    
    func drawKoch(from: CGPoint, to: CGPoint, context: CGContext, deep: Int) {
        let pathOld = CGMutablePath()
        pathOld.move(to: from)
        pathOld.addLine(to: to)
        context.setStrokeColor(UIColor.white.cgColor)
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
        context.setStrokeColor(color)
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        if deep > 1 {
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
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
    }
}
