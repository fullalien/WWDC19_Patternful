//
//  LiveViewController.swift
//  Book_Sources
//
//  Created by 白梵 on 2019/3/16.
//

import UIKit
import PlaygroundSupport

@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    var sceneName: String!
    
    var backView: UIView!
    
    var kochView: UIView!
    
    var kochDeep: Int = 3
    var kochColor: UIColor = UIColor.black
    
    var welcomeText: UILabel!
    
    var rotateAngle: Float = 90
    var kochRule: String = "F+F−F−F+F"
    
    var startAngle: Float = 120
    var axiom: String = "F-G-G"
    var firstRule: String = "F-G+F+G-F"
    var secondRule: String = "GG"
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(sceneName: String) {
        super.init(nibName: nil, bundle: nil)
        self.sceneName = sceneName
    }
    
    public override func viewDidLoad() {
        switch sceneName {
            case "welcome":
                backView = UIView(frame: view.frame)
                backView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                view.addSubview(backView)
                kochView = Koch(frame: self.view.frame, lineWidth: 2, color: UIColor.white, deep: kochDeep, sideLength: 350, isRainBow: false)
                kochView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.welcomeText = UILabel(frame: CGRect(x: 0, y: 0, width: 550, height: 300))
                self.welcomeText.text = "PATTERNFUL"
                self.welcomeText.font = UIFont(name: "PingFang SC", size: 78)
                self.welcomeText.textColor = UIColor.white
                self.welcomeText.textAlignment = NSTextAlignment.center
                self.welcomeText.backgroundColor = UIColor.clear
                backView.addSubview(kochView)
                backView.addSubview(welcomeText)
            case "koch":
                backView = UIView(frame: view.frame)
                backView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                view.addSubview(backView)
                kochView = Koch(frame: self.view.frame, lineWidth: 2, color: UIColor.white, deep: kochDeep, sideLength: 350, isRainBow: false)
                kochView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                backView.addSubview(kochView)
            case "sierpinski_triangle":
                backView = UIView(frame: view.frame)
                backView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                view.addSubview(backView)
                self.startAngle = 90
                self.rotateAngle = 120
                drawTwoRule(deep: 4, singleGraph: true, randomColor: true, isRainBow: true, lineWidth: 2, lineColor: UIColor.white)
            case "thank_you":
                backView = UIView(frame: view.frame)
                backView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                view.addSubview(backView)
                kochView = WWDC(frame: self.view.frame)
                kochView.backgroundColor = UIColor.clear
                backView.addSubview(kochView)
            case "koch_curve":
                let minDimension = min(view.frame.size.width, view.frame.size.height)
                backView = UIView(frame: view.frame)
                backView.backgroundColor = UIColor.white
                kochView = KochCurve(frame: CGRect(x: backView.frame.midX-(minDimension/4), y: view.frame.midY-(minDimension/4), width: (minDimension/2), height: (minDimension/2)), deep: kochDeep, rotateAngle: rotateAngle, rule: kochRule)
                kochView.backgroundColor = UIColor.white
                view.addSubview(backView)
                backView.addSubview(kochView)
            case "hibert_curve":
                backView = UIView(frame: view.frame)
                backView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                view.addSubview(backView)
                kochView = HilbertCurve(frame: self.view.frame, deep: 5, startAngle: 0, rotateAngle: 90, rule: "-BF+AFA+FB-", secRule: "+AF-BFB-FA+", start: "A", lineColor: UIColor.randomColor, isRainBow: true)
                kochView.backgroundColor = UIColor.clear
                backView.addSubview(kochView)
            default:
                print("error")
        }
    }
    
    override public func viewDidLayoutSubviews() {
        if backView != nil && kochView != nil {
            self.backView.frame = self.view.frame
            self.backView.center = self.view.center
            self.kochView.center = self.backView.center
        }
        
        if welcomeText != nil {
            self.welcomeText.center = self.view.center
        }
    }
    
    public func receive(_ message: PlaygroundValue) {
        switch message {
            case let .dictionary(dictionary):
                guard case let .string(command)? = dictionary["command"] else {
                    return
                }
                switch command {
                    case "koch":
                        if case let PlaygroundValue.array(message)? = dictionary["message"] {
                            if case let .integer(d) = message[0] {
                                if case let .floatingPoint(red) = message[1] {
                                    if case let .floatingPoint(green) = message[2] {
                                        if case let .floatingPoint(blue) = message[3] {
                                            if case let .floatingPoint(alpha) = message[4] {
                                                if case let .floatingPoint(redB) = message[5] {
                                                    if case let .floatingPoint(greenB) = message[6] {
                                                        if case let .floatingPoint(blueB) = message[7] {
                                                            if case let .floatingPoint(alphaB) = message[8] {
                                                                if case let .floatingPoint(lineL) = message[9] {
                                                                    if case let .floatingPoint(sideL) = message[10] {
                                                                        if case let .boolean(isRainB) = message[11] {
                                                                            self.kochDeep = d
                                                                            self.kochColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
                                                                            let backBC = UIColor(red: CGFloat(redB), green: CGFloat(greenB), blue: CGFloat(blueB), alpha: CGFloat(alphaB))
                                                                            
                                                                            backView.backgroundColor = backBC
                                                                            kochView = Koch(frame: self.view.frame, lineWidth: CGFloat(lineL), color: kochColor, deep: kochDeep, sideLength: CGFloat(sideL), isRainBow: isRainB)
                                                                            backView.subviews[0].removeFromSuperview()
                                                                            kochView.backgroundColor = backBC
                                                                            
                                                                            backView.addSubview(kochView)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        break
                    case "sierpinski_triangle":
                        if case let PlaygroundValue.array(message)? = dictionary["message"] {
                            if case let .string(st) = message[0] {
                                if case let .string(fir) = message[1] {
                                    if case let .string(sec) = message[2] {
                                        if case let .integer(d) = message[3] {
                                            if case let .integer(sa) = message[4] {
                                                if case let .integer(ra) = message[5] {
                                                    if case let .boolean(sinG) = message[6] {
                                                        if case let .boolean(ranC) = message[7] {
                                                            if case let .boolean(isRainBow) = message[8] {
                                                                if case let .floatingPoint(lineW) = message[9] {
                                                                    if case let .floatingPoint(red) = message[10] {
                                                                        if case let .floatingPoint(green) = message[11] {
                                                                            if case let .floatingPoint(blue) = message[12] {
                                                                                if case let .floatingPoint(alpha) = message[13] {
                                                                                    if case let .floatingPoint(redB) = message[14] {
                                                                                        if case let .floatingPoint(greenB) = message[15] {
                                                                                            if case let .floatingPoint(blueB) = message[16] {
                                                                                                if case let .floatingPoint(alphaB) = message[17] {
                                                                                                    self.axiom = st
                                                                                                    self.firstRule = fir
                                                                                                    self.secondRule = sec
                                                                                                    self.kochDeep = d
                                                                                                    self.startAngle = Float(sa)
                                                                                                    self.rotateAngle = Float(ra)
                                                                                                    
                                                                                                    let lineColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
                                                                                                    let backBC = UIColor(red: CGFloat(redB), green: CGFloat(greenB), blue: CGFloat(blueB), alpha: CGFloat(alphaB))
                                                                                                    
                                                                                                    backView.backgroundColor = backBC
                                                                                                    
                                                                                                    drawTwoRule(deep: kochDeep, singleGraph: sinG, randomColor: ranC, isRainBow: isRainBow, lineWidth: CGFloat(lineW), lineColor: lineColor)
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    case "koch_curve":
                        if case let PlaygroundValue.array(message)? = dictionary["message"] {
                            if case let .integer(d) = message[0] {
                                if case let .integer(a) = message[1] {
                                    if case let .string(r) = message[2] {
                                        self.kochDeep = d
                                        self.rotateAngle = Float(a)
                                        self.kochRule = r
                                        let minDimension = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
                                        kochView = KochCurve(frame: CGRect(x: backView.frame.midX-(minDimension/4), y: view.frame.midY-(minDimension/4), width: (minDimension/2), height: (minDimension/2)), deep: kochDeep, rotateAngle: rotateAngle, rule: kochRule)
                                        backView.subviews[0].removeFromSuperview()
                                        kochView.backgroundColor = UIColor.white
                                        backView.addSubview(kochView)
                                    }
                                }
                            }
                        }
                    default:
                    print("error")
                }
            default:
                print("error")
        }
    }
    
    func drawTwoRule(deep: Int, singleGraph: Bool, randomColor: Bool, isRainBow: Bool, lineWidth: CGFloat, lineColor: UIColor) {
        let minDimension = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
        let height = CGFloat(Double((20 * pow(2, deep)).description)!) + 1
        let width: CGFloat = height * CGFloat(sin(Double.pi/3))
        
        for view in self.backView.subviews {
            view.removeFromSuperview()
        }
        
        var itemView: UIView
        if !singleGraph {
            let coloumCount = Int(self.view.frame.width / width) + 1
            let rowCount = Int(self.view.frame.height / height) + 1
            for coloumIndex in 0..<coloumCount {
                for rowIndex in 0..<rowCount {
                    itemView = SierpinskiTriangle(frame: CGRect(x: CGFloat(coloumIndex) * width, y: CGFloat(rowIndex) * height, width: width, height: height), deep: deep, startAngle: 90, rotateAngle: 120, firstRule: "F-G+F+G-F", secondRule: "GG", axiom: "F-G-G", lineColor: randomColor ? UIColor.randomColor : lineColor, isSingle: false, isRainBow: isRainBow, lineWidth: lineWidth)
                    itemView.backgroundColor = UIColor.clear
                    backView.addSubview(itemView)
                    
                    itemView = SierpinskiTriangle(frame: CGRect(x: CGFloat(coloumIndex) * width, y: CGFloat(rowIndex) * height - height/2 - 1, width: width, height: height), deep: deep, startAngle: 90, rotateAngle: 120, firstRule: "F-G+F+G-F", secondRule: "GG", axiom: "F-G-G", lineColor: randomColor ? UIColor.randomColor : lineColor, isSingle: false, isRainBow: isRainBow, lineWidth: lineWidth)
                    itemView.transform = CGAffineTransform(rotationAngle: CGFloat(180 * Double.pi / 180.0));
                    itemView.backgroundColor = UIColor.clear
                    backView.addSubview(itemView)
                }
            }
        } else {
            let rect = CGRect(x: backView.frame.midX-(minDimension/4), y: view.frame.midY-(minDimension/4), width: minDimension, height: minDimension)
            kochView = SierpinskiTriangle(frame: rect, deep: deep, startAngle: startAngle, rotateAngle: rotateAngle, firstRule: firstRule, secondRule: secondRule, axiom: axiom, lineColor: randomColor ? UIColor.randomColor : lineColor, isSingle: true, isRainBow: isRainBow, lineWidth: lineWidth)
            kochView.backgroundColor = UIColor.clear
            backView.addSubview(kochView)
            
            self.backView.frame = self.view.frame
            self.backView.center = self.view.center
            self.kochView.center = self.backView.center
        }
    }
    
    /*
     public func liveViewMessageConnectionOpened() {
     // Implement this method to be notified when the live view message connection is opened.
     // The connection will be opened when the process running Contents.swift starts running and listening for messages.
     }
     */
    
    /*
     public func liveViewMessageConnectionClosed() {
     // Implement this method to be notified when the live view message connection is closed.
     // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
     // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
     }
     */
}
