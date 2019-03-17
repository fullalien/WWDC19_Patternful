//#-hidden-code
import PlaygroundSupport
import SpriteKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 ### Koch Snowflake
 You also can call it **Koch Curve**, **Koch Star** or **Koch Island**. As you saw on the right, it is really like a snowflake. 😜
 
 ##### How To Draw It?
 The Koch snowflake can be constructed by starting with an equilateral triangle, then recursively altering each line segment as follows:
 1. divide the line segment into three segments of equal length.
 2. draw an equilateral triangle that has the middle segment from step 1 as its base and points outward.
 3. remove the line segment that is the base of the triangle from step 2.
 
*/
//#-code-completion(everything, hide)

let deep = /*#-editable-code*/3/*#-end-editable-code*/
let lineColor = /*#-editable-code*/#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)/*#-end-editable-code*/
let backGroundColor = /*#-editable-code*/#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)/*#-end-editable-code*/
let lineWidth = /*#-editable-code*/2/*#-end-editable-code*/
let sideLength = /*#-editable-code*/350/*#-end-editable-code*/
let isRainBow = /*#-editable-code*/false/*#-end-editable-code*/

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
    "command": .string("koch"),
    "message": PlaygroundValue.array([PlaygroundValue.integer(deep)
        , PlaygroundValue.floatingPoint(Double(red)), PlaygroundValue.floatingPoint(Double(green)), PlaygroundValue.floatingPoint(Double(blue)), PlaygroundValue.floatingPoint(Double(alpha))
        , PlaygroundValue.floatingPoint(Double(redB)), PlaygroundValue.floatingPoint(Double(greenB)), PlaygroundValue.floatingPoint(Double(blueB)), PlaygroundValue.floatingPoint(Double(alphaB))
        , PlaygroundValue.floatingPoint(Double(lineWidth)), PlaygroundValue.floatingPoint(Double(sideLength))
        , PlaygroundValue.boolean(isRainBow)])
    ])
proxy.send(command)
//#-end-hidden-code


