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

let randomColor = /*#-editable-code*/false/*#-end-editable-code*/
let isRainBow = /*#-editable-code*/true/*#-end-editable-code*/

let lineColor = /*#-editable-code*/#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)/*#-end-editable-code*/
let backGroundColor = /*#-editable-code*/#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)/*#-end-editable-code*/

//#-hidden-code
let command: PlaygroundValue

var red: CGFloat = 0.0
var green: CGFloat = 0.0
var blue: CGFloat = 0.0
var alpha: CGFloat = 0.0

var redB: CGFloat = 0.0
var greenB: CGFloat = 0.0
var blueB: CGFloat = 0.0
var alphaB: CGFloat = 0.0

lineColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
backGroundColor.getRed(&redB, green: &greenB, blue: &blueB, alpha: &alphaB)

command = .dictionary([
    "command": .string("sierpinski_triangle"),
    "message": PlaygroundValue.array([PlaygroundValue.string(axiom), PlaygroundValue.string(firstRule), PlaygroundValue.string(secondRule)
        , PlaygroundValue.integer(deep)
        , PlaygroundValue.integer(startAngle), PlaygroundValue.integer(rotateAngle)
        , PlaygroundValue.boolean(singleGraph), PlaygroundValue.boolean(randomColor), PlaygroundValue.boolean(isRainBow)
        , PlaygroundValue.floatingPoint(Double(lineWidth))
        , PlaygroundValue.floatingPoint(Double(red)), PlaygroundValue.floatingPoint(Double(green)), PlaygroundValue.floatingPoint(Double(blue)), PlaygroundValue.floatingPoint(Double(alpha))
        , PlaygroundValue.floatingPoint(Double(redB)), PlaygroundValue.floatingPoint(Double(greenB)), PlaygroundValue.floatingPoint(Double(blueB)), PlaygroundValue.floatingPoint(Double(alphaB))])
    ])
proxy.send(command)
//#-end-hidden-code

