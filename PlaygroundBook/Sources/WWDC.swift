//
//  WWDC.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/19.
//

import UIKit

class WWDC: UIView {
    var lineColor: CGColor = UIColor.black.cgColor
    var lineWidth: CGFloat = 1
    
    var startAngle: Float = 0
    var rotateAngle: Float = 90
    
    var lineLength: Float = 15
    
    var isRainBow: Bool = true
    
    var centerP: CGPoint = CGPoint(x: 0, y: 0)
    
    var currentPo: CGPoint = CGPoint(x: 100, y: 100)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        
        drawDragonCurve(context: context)
        
        isRainBow = true
        lineWidth = 4
        lineLength = 15
        startAngle = 0
        
        draw2(context: context)
        draw0(context: context)
        draw1(context: context)
        draw9(context: context)

        drawW(context: context)
        drawSecondW(context: context)
        drawO(context: context)
        drawC(context: context)
    }
    
    func drawDragonCurve(context: CGContext) {
        var start = "F"
        
        for _ in 1...5 {
            start = start.replacingOccurrences(of: "F", with: "F+F−F−F+F")
//            start = start.replacingOccurrences(of: "X", with: "X+YF+")
        }
        
        lineLength = 13.44
        isRainBow = false
        lineWidth = 2
        lineColor = UIColor(red:0.95,green:0.95,blue:0.95,alpha:1.00).cgColor
        startAngle = 90
        
        currentPo = CGPoint(x: center.x + CGFloat(lineLength * 13.5), y: center.y - CGFloat(15 * 10 + lineLength * 10))
        drawLines(data: start, context: context)
        
        
        startAngle = -90
        
        currentPo = CGPoint(x: center.x - CGFloat(lineLength * 13.5), y: center.y + CGFloat(15 * 10 + lineLength * 10))
        drawLines(data: start, context: context)
    }
    
    func draw2(context: CGContext) {
        let data = "FFFFF+FFFF+FFFF-FF-FFFF+F+FFFFF+FFFF+FFFF-FF-FFFF+F"
        
        currentPo = CGPoint(x: center.x - CGFloat(13 * lineLength), y: center.y - CGFloat(8 * lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
    }
    
    func draw0(context: CGContext) {
        let data = "FFFFF+FFFFFFF+FFFFF+FFFFFFF"
        let secondData = "FFF+FFFFF+FFF+FFFFF"
        
        currentPo = CGPoint(x: center.x - CGFloat(6 * lineLength), y: center.y - CGFloat(8 * lineLength))
        let startP = currentPo + CGPoint(x: CGFloat(lineLength), y: CGFloat(lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
        
        currentPo = startP
        startAngle = 0
        drawLines(data: secondData, context: context)
    }
    
    func draw1(context: CGContext) {
        let data = "FF+FFFFFF-FF+F+FFFFF+F+FF-FFFFF-F+F"
        
        currentPo = CGPoint(x: center.x + CGFloat(2 * lineLength), y: center.y - CGFloat(8 * lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
    }
    
    func draw9(context: CGContext) {
        let data = "FFFFF+FFFFFFF+FFFFF+F+FFFF-FF-FFFF+FFFF"
        let secondData = "FFF+FF+FFF+FF"
        
        currentPo = CGPoint(x: center.x + CGFloat(8 * lineLength), y: center.y - CGFloat(8 * lineLength))
        let startP = currentPo + CGPoint(x: CGFloat(lineLength), y: CGFloat(lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
        
        currentPo = startP
        startAngle = 0
        drawLines(data: secondData, context: context)
    }
    
    func drawW(context: CGContext) {
        let data = "F+FFFFFF-F-FFFFFF+F+FFFFFF-F-FFFFFF+F+FFFFFFF+FFFFF+FFFFFFF"
        
        currentPo = CGPoint(x: center.x - CGFloat(13 * lineLength), y: center.y + CGFloat(1 * lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
    }
    
    func drawSecondW(context: CGContext) {
        let data = "F+FFFFFF-F-FFFFFF+F+FFFFFF-F-FFFFFF+F+FFFFFFF+FFFFF+FFFFFFF"
        
        currentPo = CGPoint(x: center.x - CGFloat(6 * lineLength), y: center.y + CGFloat(1 * lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
    }
    
    func drawO(context: CGContext) {
        let data = "FFFFF+FFFFFFF+FFFFF+FFFFFFF"
        let secondData = "FFF+FFFFF+FFF+FFFFF"
        
        currentPo = CGPoint(x: center.x + CGFloat(1 * lineLength), y: center.y + CGFloat(1 * lineLength))
        let startP = currentPo + CGPoint(x: CGFloat(lineLength), y: CGFloat(lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
        
        currentPo = startP
        startAngle = 0
        drawLines(data: secondData, context: context)
    }
    
    func drawC(context: CGContext) {
        let data = "FFFFF+F+FFFF-FFFFF-FFFF+F+FFFFF+FFFFFFF"
        
        currentPo = CGPoint(x: center.x + CGFloat(8 * lineLength), y: center.y + CGFloat(1 * lineLength))
        startAngle = 0
        drawLines(data: data, context: context)
    }
    
    func drawLines(data: String, context: CGContext) {
        for item in data {
            switch item {
                case "F":
                    drawLine(context: context)
                case "+":
                    startAngle = startAngle + rotateAngle
                case "-":
                    startAngle = startAngle - rotateAngle
                default:
                    print("error")
            }
        }
    }
    
    func drawLine(context: CGContext) {
        let angleF = Double(startAngle.truncatingRemainder(dividingBy: 360)/180) * Double.pi
        let to = CGPoint(x: currentPo.x + CGFloat(Double(lineLength) * cos(angleF)), y: currentPo.y + CGFloat(Double(lineLength) * sin(angleF)))
        
        let path = CGMutablePath()
        path.move(to: currentPo)
        path.addLine(to: to)
        context.setStrokeColor(isRainBow ? UIColor.randomColor.cgColor : lineColor)
        context.setLineCap(CGLineCap.round)
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        currentPo = to
    }

}
