//#-hidden-code
import PlaygroundSupport
import SpriteKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

var deepK: Int = 3
var colorK: UIColor = UIColor.blue
var ruleK: String = "F+F−F−F+F"
var rotateAngle: Int = 90
func setDeep(deep: Int) {
    deepK = deep
}
func setRotateAngle(angle: Int) {
    rotateAngle = angle
}
func setRule(rule: String) {
    ruleK = rule
}
//#-end-hidden-code
/*:
 ## Koch Curve
 
*/
//#-code-completion(everything, hide)

setDeep(deep: /*#-editable-code*/3/*#-end-editable-code*/)
setRule(rule: /*#-editable-code*/"F+F−F−F+F"/*#-end-editable-code*/)
setRotateAngle(angle: /*#-editable-code*/90/*#-end-editable-code*/)

//#-hidden-code
let command: PlaygroundValue
command = .dictionary([
    "command": .string("koch_curve"),
    "message": PlaygroundValue.array([PlaygroundValue.integer(deepK), PlaygroundValue.integer(rotateAngle), PlaygroundValue.string(ruleK)])
    ])
proxy.send(command)
//#-end-hidden-code


