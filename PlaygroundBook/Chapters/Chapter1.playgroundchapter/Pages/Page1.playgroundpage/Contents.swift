//#-hidden-code
import PlaygroundSupport
import UIKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 ### An Amazing Snowflake
 You can also call it **Koch Curve**, **Koch Star** or **Koch Island**. As you saw on the right, it's really like a snowflake. 😜
 
 ##### How To Draw It?
 The Koch snowflake can be constructed by starting with an equilateral triangle, then recursively altering each line segment as follows:
 1. divide the line segment into three segments of equal length.
 2. draw an equilateral triangle that has the middle segment from step 1 as its base and points outward.
 3. remove the line segment that is the base of the triangle from step 2.
 
 #### Let's Start
 Modify the values below to see what will happen. **Just do it, anytime you can reset this page to restart**.
 
 * Set `deep` from 1 to 5, what will happen?, can you find out the pattern?
 * Set `lineColor`, `backGroundColor` to your favorite color.
 * Set `isRainBow` true, what does it look like?
 
 > `deep` shouldn't be too large, otherwise playground will run for a long time to draw it.
 > `lineColor` only works when `isRainBow` is false.
 > `lineColor` shouldn't be the same as `backGroundColor`.
 
 When you are done, you can turn to the next page: [Sierpinski Triangle](@next)
 
*/
//#-code-completion(everything, hide)

// Try using a Int number, like 1 or 2
let deep = /*#-editable-code*/3/*#-end-editable-code*/

// Change up some of the colors!
let lineColor = /*#-editable-code*/#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)/*#-end-editable-code*/
let backGroundColor = /*#-editable-code*/#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)/*#-end-editable-code*/

// Enable random color of each line
let isRainBow = /*#-editable-code*/false/*#-end-editable-code*/

// Change the width of the line
let lineWidth = /*#-editable-code*/2/*#-end-editable-code*/

// Change the size of the snowflake
let sideLength = /*#-editable-code*/350/*#-end-editable-code*/

//#-hidden-code
//#-code-completion(everything, hide)
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


