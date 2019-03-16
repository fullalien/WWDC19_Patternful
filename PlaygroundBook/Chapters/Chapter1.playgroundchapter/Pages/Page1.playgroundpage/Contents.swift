//#-hidden-code
import PlaygroundSupport
import SpriteKit

let page = PlaygroundPage.current
let proxy = page.liveView as! PlaygroundRemoteLiveViewProxy

var deepK: Int = 3
var colorK: UIColor = UIColor.blue
func setDeep(_ deep: Int) {
    deepK = deep
}
func setColor(_ color: UIColor) {
    colorK = color
}
//#-end-hidden-code
/*:
 ## Koch
 
*/
//#-code-completion(everything, hide)

setDeep(/*#-editable-code*/3/*#-end-editable-code*/)
setColor(/*#-editable-code*/#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)/*#-end-editable-code*/)

//#-hidden-code
let command: PlaygroundValue
var red: CGFloat = 0.0
var green: CGFloat = 0.0
var blue: CGFloat = 0.0
var alpha: CGFloat = 0.0
colorK.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
command = .dictionary([
    "command": .string("koch"),
    "message": PlaygroundValue.array([PlaygroundValue.integer(deepK), PlaygroundValue.floatingPoint(Double(red)), PlaygroundValue.floatingPoint(Double(green)), PlaygroundValue.floatingPoint(Double(blue)), PlaygroundValue.floatingPoint(Double(alpha))])
    ])
proxy.send(command)
//#-end-hidden-code


