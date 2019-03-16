//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  An auxiliary source file which is part of the book-level auxiliary sources.
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import SpriteKit
import PlaygroundSupport

@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
    var sceneName: String!
    
    var backView: UIView!
    
    var kochView: UIView!
    
    var kochDeep: Int = 3
    var kochColor: UIColor = UIColor.black
    
    var rotateAngle: Float = 90
    var kochRule: String = "F+F−F−F+F"
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(sceneName: String) {
        super.init(nibName: nil, bundle: nil)
        self.sceneName = sceneName
    }
    
    public override func viewDidLoad() {
        switch sceneName {
            case "koch":
                let minDimension = min(view.frame.size.width, view.frame.size.height)
                backView = UIView(frame: view.frame)
                backView.backgroundColor = UIColor.white
                kochView = Koch(frame: CGRect(x: backView.frame.midX-(minDimension/4), y: view.frame.midY-(minDimension/4), width: (minDimension/2), height: (minDimension/2)), lineWidth: 2, color: kochColor, deep: kochDeep)
                kochView.backgroundColor = UIColor.white
                view.addSubview(backView)
                backView.addSubview(kochView)
            case "koch_curve":
                let minDimension = min(view.frame.size.width, view.frame.size.height)
                backView = UIView(frame: view.frame)
                backView.backgroundColor = UIColor.white
                kochView = KochCurve(frame: CGRect(x: backView.frame.midX-(minDimension/4), y: view.frame.midY-(minDimension/4), width: (minDimension/2), height: (minDimension/2)), deep: kochDeep, rotateAngle: rotateAngle, rule: kochRule)
                kochView.backgroundColor = UIColor.white
                view.addSubview(backView)
                backView.addSubview(kochView)
            default:
                print("error")
        }
    }
    
    override public func viewDidLayoutSubviews() {
        if backView != nil {
            self.backView.frame = self.view.frame
            self.backView.center = self.view.center
            self.kochView.center = self.backView.center
        }
    }
    
    public func receive(_ message: PlaygroundValue) {
        // Implement this method to receive messages sent from the process running Contents.swift.
        // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
        // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
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
                                                self.kochDeep = d
                                                self.kochColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
                                                let minDimension = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
                                                kochView = Koch(frame: CGRect(x: backView.frame.midX-(minDimension/4), y: view.frame.midY-(minDimension/4), width: (minDimension/2), height: (minDimension/2)), lineWidth: 2, color: kochColor, deep: kochDeep)
                                                backView.subviews[0].removeFromSuperview()
                                                kochView.backgroundColor = UIColor.white
                                                backView.addSubview(kochView)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        break
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
