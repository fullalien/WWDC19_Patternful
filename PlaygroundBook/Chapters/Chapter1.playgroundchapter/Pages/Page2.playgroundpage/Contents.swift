//#-hidden-code
import PlaygroundSupport
import SpriteKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 ## Koch Curve
 
*/
//#-code-completion(everything, hide)

let axiom = /*#-editable-code*/"F-G-G"/*#-end-editable-code*/
let firstRule = /*#-editable-code*/"F-G+F+G-F"/*#-end-editable-code*/
let secondRule = /*#-editable-code*/"GG"/*#-end-editable-code*/

let singleGraph = /*#-editable-code*/true/*#-end-editable-code*/
let startAngle = /*#-editable-code*/90/*#-end-editable-code*/
let rotateAngle = /*#-editable-code*/120/*#-end-editable-code*/

let deep = /*#-editable-code*/4/*#-end-editable-code*/
let lineWidth = /*#-editable-code*/2/*#-end-editable-code*/

let randomColor = /*#-editable-code*/true/*#-end-editable-code*/
let isRainBow = /*#-editable-code*/true/*#-end-editable-code*/

//#-hidden-code
let command: PlaygroundValue
command = .dictionary([
    "command": .string("sierpinski_triangle"),
    "message": PlaygroundValue.array([PlaygroundValue.string(axiom), PlaygroundValue.string(firstRule), PlaygroundValue.string(secondRule)
        , PlaygroundValue.integer(deep)
        , PlaygroundValue.integer(startAngle), PlaygroundValue.integer(rotateAngle)
        , PlaygroundValue.boolean(singleGraph), PlaygroundValue.boolean(randomColor), PlaygroundValue.boolean(isRainBow)
        , PlaygroundValue.floatingPoint(Double(lineWidth))])
    ])
proxy.send(command)
//#-end-hidden-code

