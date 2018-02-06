//: [Previous](@previous)
/*:
 ## Protocols
 Protocols are a defined contract or blueprint that a class, struct or enum must follow.
 */
/*:
 Here we define a 'ShapeProtocol' where anything that conforms to it must provide a property of number of sides and a function called 'shapeDescription'
 */
protocol ShapeProtocol {
  var numberOfSides: Int { get set }
  var color : String { get set }
  init(color:String)
  func area()
  func shapeDescription()
}

/*:
 This 'Square' class conforms to the 'ShapeProtocol' and defines the number of sides for this shape and it has the shapeDescription method inside.
 */
class Square: ShapeProtocol {
  var numberOfSides: Int
  var color: String
  
  required init(color: String) {
    self.color = color
    self.numberOfSides = 4
  }
  
  func area() {
  }
  
  func shapeDescription() {
    
    print("This is a square")
  }
}

/*:
 - Experiment:
 Add a new function in our 'ShapeProtocol' that should calculate the area of its shape. Make sure you implement it in our 'Square' class as well.
 */

/*:
 - Experiment:
 Add a new property in our 'ShapeProtocol' of type String that indicates the colour of this shape.
 */

/*:
 - Experiment:
 We can also declare a custom initializer within our 'ShapeProtocol' that any class must have present. Create an initializer that takes in a colour as a parameter.
 */

/*:
 - Callout(Challenge):
 Define a person protocol with name, gender, age and add a custom initializer to set all the properties and a function to print a description of this person. Create a 'Student' class that conforms to this protocol and print the description of this student using its name.
 */

protocol Person {
  var name : String { get set }
  var gender : String { get set }
  var age : String { get set }
  
  init(name: String, gender: String, age: String)
  func personDescription()
}

class Student : Person {
  var name: String
  var gender: String
  var age: String
  
  required init(name: String, gender: String, age: String) {
    self.name = name
    self.gender = gender
    self.age = age
  }
  
  func personDescription() {
    print("\(name) is a \(age)-year-old \(gender)")
  }
}

var ryan = Student(name: "Ryan", gender: "male", age: "27")
ryan.personDescription()

/*:
 ## Extensions
 Extensions are a way to add additional functions to an existing class, struct or enum.
 \
 For example, I can extend the `'Double'` class to add a function I may use very often such as squaring a number. ie: 4*4 = 16
 
 - Note:
 Extensions are like categories from Objective-C. Unlike Objective-C categories, Swift extensions do not have names.
 */

// This is declaring an extension on the Double class
extension Double {
  
  // This 'square' function takes its own value and multiples it by itself, then returns the new value
  func square() -> Double {
    
    return self * self
  }
}

var myDoubleValue = 5.0
var mySquaredDoubleValue = myDoubleValue.square()

/*:
 - Experiment:
 Try adding the 'square' function to the `Float` type
 */

extension Float {
  func square() -> Float {
    return self * self
  }
}

var myFloatValue : Float = 5.0
myFloatValue.square()

/*:
 We are going to add a few extensions to several classes that you could potentially use for your future projects to make things more convenient.
 */
/*:
 - Callout(Challenge):
 Create an extension on UIColor that converts hex represented colours to a UIColor to use. ex: #FFFFFF would give a UIColor of white (Hint: You can google the algorithm on how to convert hex values to a UIColor)
 */

import UIKit

extension UIColor {
  convenience init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt32()
    Scanner(string: hex).scanHexInt32(&int)
    let a, r, g, b: UInt32
    
    switch hex.count {
    case 3:
      (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:
      (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:
      (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (a, r, g, b) = (255, 0, 0, 0)
    }
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }
}

var myColor = UIColor(hexString: "#FFFFFF")

/*:
 - Callout(Challenge):
 Create an extension on `String` called 'trim'. This will return a `String` that has the whitespace trimmed from the beginning and end. For example: "    hello there  " will return "hellothere"
 */

extension String {
  func trim() -> String {
    return self.replacingOccurrences(of: " ", with: "")
  }
}

var myString = "  hello there  "
myString.trim()

/*:
 - Callout(Challenge):
 Create an extension on String that checks if an email address has a valid format. You can make the rules as strict or as loose as you'd like. Rules can include verifying there are no spaces, there is a '@' present, etc.
 */

extension String {
  func isValidEmailAddress() -> Bool {
    if !self.contains("@") {
      return false
    }
    
    if !(self.hasSuffix(".com") || self.hasSuffix(".ca")) {
      return false
    }
    
    return true
  }
}

var myEmail = "ryanmaksymic@gmail.com"
myEmail.isValidEmailAddress()

/*:
 - Callout(Challenge):
 Create an extension on `Double` to add a function that converts the number of seconds into minutes and another function to hours. ex: Given 900 seconds, the minutes returned will be 15 minutes, and the hours returned would be 0.25 hours.
 */

extension Double {
  func minutesFromSeconds() -> Double {
    return self/60.0
  }
  
  func hoursFromSeconds() -> Double {
    return (self/60.0)/60.0
  }
}

var myDouble : Double = 900
myDouble.minutesFromSeconds()
myDouble.hoursFromSeconds()

//: [Next](@next)
