//
//  TwoRuleL.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/16.
//

import UIKit

class SierpinskiTriangle: UIView {
    var lineColor: CGColor = UIColor.black.cgColor
    var lineWidth: CGFloat = 1
    var deep: Int = 3
    
    var drawData: String = "F-G-G"
    var firstRule: String = "F-G+F+G-F"
    var secondRule: String = "GG"
    
    var startAngle: Float = 0
    var rotateAngle: Float = 120
    
    var lineLength: Float = 20
    
    var isRainBow: Bool = true
    
    var disPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    var currentPo: CGPoint = CGPoint(x: 100, y: 100)
    
    public init(frame: CGRect, deep: Int, startAngle: Float, rotateAngle: Float, firstRule: String, secondRule: String, axiom: String, lineColor: UIColor, isSingle: Bool, isRainBow: Bool, lineWidth: CGFloat) {
        self.deep = deep >= 0 ? deep : 0
        self.rotateAngle = rotateAngle
        self.startAngle = startAngle
        self.firstRule = firstRule
        self.secondRule = secondRule
        self.drawData = axiom
        self.lineColor = lineColor.cgColor
        self.isRainBow = isRainBow
        self.lineWidth = lineWidth > 0 ? lineWidth : 1
        super.init(frame: frame)
        
        if isSingle {
            currentPo = CGPoint(x: frame.width/2, y: frame.height/2)
            let L1 = CGFloat(Double((20 * pow(2, deep)).description)!) * 1/2 / CGFloat(cos(Double.pi/6))
            let angleF = Double(startAngle.truncatingRemainder(dividingBy: 360)/180) * Double.pi
            disPoint = CGPoint(x: L1 * CGFloat(cos(angleF - Double.pi/6)), y: L1 * CGFloat(sin(angleF - Double.pi/6)))
        } else {
            currentPo = CGPoint(x: 0, y: 0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        if deep > 0 {
            initialDrawData()
        }
        
//        switch deep {
//        case 1:
//            lineLength = 20
//        case 2:
//            lineLength = 20
//        case 3:
//            lineLength = 10
//        case 4:
//            lineLength = 5
//        case 5:
//            lineLength = 2
//        default:
//            print("error")
//        }
        
        for item in drawData {
            switch item {
            case "F":
                drawLine(context: context)
            case "G":
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
            drawData = drawData.replacingOccurrences(of: "G", with: secondRule)
            drawData = drawData.replacingOccurrences(of: "F", with: firstRule)
        }
    }
    
    func drawLine(context: CGContext) {
        let angleF = Double(startAngle.truncatingRemainder(dividingBy: 360)/180) * Double.pi
        let to = CGPoint(x: currentPo.x + CGFloat(Double(lineLength) * cos(angleF)), y: currentPo.y + CGFloat(Double(lineLength) * sin(angleF)))
        
        let path = CGMutablePath()
        path.move(to: currentPo - disPoint)
        path.addLine(to: to - disPoint)
        context.setStrokeColor(isRainBow ? UIColor.randomColor.cgColor : lineColor)
        context.setLineCap(CGLineCap.round)
        context.addPath(path)
        context.setLineWidth(lineWidth)
        context.strokePath()
        
        currentPo = to
    }

}
