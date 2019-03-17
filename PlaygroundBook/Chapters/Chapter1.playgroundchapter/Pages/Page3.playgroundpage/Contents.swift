//#-hidden-code
import PlaygroundSupport
import SpriteKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

var deepK: Int = 3
var colorK: UIColor = UIColor.blue
var ruleF: String = "F-G+F+G-F"
var ruleS: String = "GG"
var startL: String = "F-G-G"
var rotateAngleL: Int = 120
var startAngleL: Int = 90
var singleGraphL: Bool = true
var randomColorL: Bool = false
var isRainBowL: Bool = true

func set(deep: Int) {
    deepK = deep
}
func set(startAngle: Int, rotateAngle: Int) {
    startAngleL = startAngle
    rotateAngleL = rotateAngle
}
func set(firstRule: String, secondRule: String) {
    ruleF = firstRule
    ruleS = secondRule
}
func set(start: String) {
    startL = start
}
func set(singleGraph: Bool) {
    singleGraphL = singleGraph
}
func set(randomColor: Bool) {
    randomColorL = randomColor
}
func set(isRainBow: Bool) {
    isRainBowL = isRainBow
}
//#-end-hidden-code
/*:
 ## Koch Curve
 
*/
//#-code-completion(everything, hide)

set(start: /*#-editable-code*/"F-G-G"/*#-end-editable-code*/)
set(firstRule: /*#-editable-code*/"F-G+F+G-F"/*#-end-editable-code*/, secondRule: /*#-editable-code*/"GG"/*#-end-editable-code*/)
set(deep: /*#-editable-code*/3/*#-end-editable-code*/)
set(startAngle: /*#-editable-code*/90/*#-end-editable-code*/, rotateAngle: /*#-editable-code*/120/*#-end-editable-code*/)
set(singleGraph: /*#-editable-code*/true/*#-end-editable-code*/)
set(randomColor: /*#-editable-code*/true/*#-end-editable-code*/)
set(isRainBow: /*#-editable-code*/true/*#-end-editable-code*/)

//#-hidden-code
let command: PlaygroundValue
command = .dictionary([
    "command": .string("two_rule_l"),
    "message": PlaygroundValue.array([PlaygroundValue.string(startL), PlaygroundValue.string(ruleF), PlaygroundValue.string(ruleS), PlaygroundValue.integer(deepK), PlaygroundValue.integer(startAngleL), PlaygroundValue.integer(rotateAngleL), PlaygroundValue.boolean(singleGraphL), PlaygroundValue.boolean(randomColorL), PlaygroundValue.boolean(isRainBowL)])
    ])
proxy.send(command)
//#-end-hidden-code

