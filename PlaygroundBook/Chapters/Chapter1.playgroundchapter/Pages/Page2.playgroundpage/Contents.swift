//#-hidden-code
import PlaygroundSupport
import SpriteKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

//#-end-hidden-code
/*:
 ### Crazy Triangle
 The graphic you see on the right is Sierpinski Triangle, it's an equilateral triangle, and subdivided recursively into smaller equilateral triangles. No matter how big it is, it is made up of smaller triangles. This is why I call it crazy triangle. 🤪
 
 You may want to know how I draw it. Before it, you may need know something below.
 * `axiom` is a start string, it's character can be  recursively replaced by the `firstRule` or `secondRule`.
 * `deep` is the number of `recursions`.
 * F or G means "draw forward", + means "turn left `rotateAngle`", - means "turn right `rotateAngle`".
 * startAngle means which angle to start.
 
 So the first step is to generate a string. Below is an example:
 * deep = 0 -> F-G-G
 * deep = 1 -> F-G+F+G-F-GG-GG
 * deep = 2 -> F-G+F+G-F-GG+F-G+F+G-F+GG-F-G+F+G-F-GGGG-GGGG
 * ......
 
 Up to now, you already got what you need know.
 
 #### Let's Start
 Modify the values below to what you want. Just blow minds, you may create a new pattern. **Anytime you can reset this page to restart**. Have fun!
 
 > `axiom`, `firstRule`, `secondRule`, `startAngle`, `rotateAngle` only works when `singleGraph` is true.
 > `randomColor` only works when `isRainBow` is false.
 > `lineColor` only works when `randomColor` and `isRainBow` are false.
 
 When you are done, you can turn to the next page: [Thank You](@next)

 
*/
//#-code-completion(everything, hide)

//
let axiom = /*#-editable-code*/"F-G-G"/*#-end-editable-code*/
let firstRule = /*#-editable-code*/"F-G+F+G-F"/*#-end-editable-code*/
let secondRule = /*#-editable-code*/"GG"/*#-end-editable-code*/

// Enable single graphic
let singleGraph = /*#-editable-code*/true/*#-end-editable-code*/

//
let startAngle = /*#-editable-code*/90/*#-end-editable-code*/
let rotateAngle = /*#-editable-code*/120/*#-end-editable-code*/


let deep = /*#-editable-code*/4/*#-end-editable-code*/

// Change the width of the line
let lineWidth = /*#-editable-code*/2/*#-end-editable-code*/

// Enable random color of each Sierpinski Triangle
let randomColor = /*#-editable-code*/false/*#-end-editable-code*/

// Enable random color of each line
let isRainBow = /*#-editable-code*/true/*#-end-editable-code*/

// Change up some of the colors!
let lineColor = /*#-editable-code*/#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)/*#-end-editable-code*/
let backGroundColor = /*#-editable-code*/#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)/*#-end-editable-code*/

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

