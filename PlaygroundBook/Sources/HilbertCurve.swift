//
//  HilbertCurve.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/17.
//

import UIKit

class HilbertCurve: UIView {
    var lineColor: CGColor = UIColor.black.cgColor
    var lineWidth: CGFloat = 2
    var deep: Int = 3
    
    var drawData: String = "A"
    var rule: String = "-BF+AFA+FB-"
    var secRule: String = "+AF-BFB-FA+"
    
    var startAngle: Float = 0
    var rotateAngle: Float = 90
    
    var lineLength: Float = 20
    
    var isRainBow: Bool = true
    
    var disPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    var currentPo: CGPoint = CGPoint(x: 100, y: 100)
    
    public init(frame: CGRect, deep: Int, startAngle: Float, rotateAngle: Float, rule: String, secRule: String, start: String, lineColor: UIColor, isRainBow: Bool) {
        self.deep = deep
        self.rotateAngle = rotateAngle
        self.startAngle = startAngle
        self.rule = rule
        self.secRule = secRule
        self.drawData = start
        self.lineColor = lineColor.cgColor
        self.isRainBow = isRainBow
        super.init(frame: frame)
        
        
        currentPo = CGPoint(x: 0, y: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        initialDrawData()
        
        for item in drawData {
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
    
    func initialDrawData() {
        for _ in 1...deep {
            drawData = drawData.replacingOccurrences(of: "B", with: secRule)
            drawData = drawData.replacingOccurrences(of: "A", with: rule)
//            drawData = drawData.replacingOccurrences(of: "B", with: secRule)
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
