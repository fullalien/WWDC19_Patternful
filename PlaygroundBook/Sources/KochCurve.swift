//
//  KochCurve.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/16.
//

import UIKit
import SpriteKit

class KochCurve: UIView {
    var lineColor: CGColor = UIColor.black.cgColor
    var lineWidth: CGFloat = 1
    var deep: Int = 3
    
    var drawData: String = "F"
    var rule: String = "F+F−F−F+F"
    var startAngle: Float = 0
    var rotateAngle: Float = 90
    
    var lineLength: Float = 5
    
    var currentPo: CGPoint = CGPoint(x: 0, y: 100)
    
    public init(frame: CGRect, deep: Int, rotateAngle: Float, rule: String) {
        self.deep = deep
        self.rotateAngle = rotateAngle
        self.rule = rule
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        initialDrawData()
        
        switch deep {
            case 1:
                lineLength = 20
            case 2:
                lineLength = 20
            case 3:
                lineLength = 10
            case 4:
                lineLength = 5
            case 5:
                lineLength = 2
            default:
                print("error")
        }
        for item in drawData {
            switch item {
                case "F":
                    drawLine(context: context)
                case "+":
                    startAngle = startAngle + rotateAngle
                case "−":
                    startAngle = startAngle - rotateAngle
                default:
                    print("error")
            }
        }
    }
    
    func initialDrawData() {
        for _ in 1...deep {
            drawData = drawData.replacingOccurrences(of: "F", with: rule)
        }
    }
    
    func drawLine(context: CGContext) {
        let angleF = Double(startAngle.truncatingRemainder(dividingBy: 360)/180) * Double.pi
        let to = CGPoint(x: currentPo.x + CGFloat(Double(lineLength) * cos(angleF)), y: currentPo.y + CGFloat(Double(lineLength) * sin(angleF)))
        
        let path = CGMutablePath()
        path.move(to: currentPo)
        path.addLine(to: to)
        context.setStrokeColor(lineColor)
        context.setLineCap(CGLineCap.round)
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        currentPo = to
    }
}
