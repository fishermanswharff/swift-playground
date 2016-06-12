//: Playground - noun: a place where people can play

import UIKit

enum SomeEnumeration {
  // enumeration definition goes here
}


enum CompassPoint {
  case North
  case South
  case East
  case West
}

// The values defined in an enumeration (such as North, South, East, and West) are its enumeration cases. You use the case keyword to introduce new enumeration cases.

/* Note:
 Unlike C and Objective-C, Swift enumeration cases are not assigned a default integer value when they are created. In the CompassPoint example above, North, South, East and West do not implicitly equal 0, 1, 2 and 3. Instead, the different enumeration cases are fully-fledged values in their own right, with an explicitly-defined type of CompassPoint.
*/

// Multiple cases can appear on a single line, separated by commas:
enum Planet {
  case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}


// Give enumeration types singular rather than plural names, so that they read as self-evident:
var directionToHead = CompassPoint.West

// Once directionToHead is declared as a CompassPoint, you can set it to a different CompassPoint value using a shorter dot syntax:
directionToHead = .East

// Matching Enumeration Values with a Switch Statement
// ————————————————————————————————————————————————————————

directionToHead = .South
switch directionToHead {
case .North:
  print("Lots of planets have a north")
case .South:
  print("Watch out for penguins")
case .East:
  print("Where the sun rises")
case .West:
  print("Where the skies are blue")
}

// Switch cases must be exhaustive when evaluating enumerations. When it is not appropriate to provide a case for every enumeration type, use default

let somePlanet = Planet.Earth

switch somePlanet {
case .Earth:
  print("Mostly harmless")
default:
  print("Not a safe place for humans")
}

// Associated Values
// —————————————————————————

enum Barcode {
  case UPCA(Int, Int, Int, Int)
  case QRCode(String)
}


var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")

// associated values can be extracted as part of the switch statement. You extract each associated value as a constant (with the let prefix) or a variable (with the var prefix) for use within the switch case’s body:

switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
  print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
  print("QR code: \(productCode).")
}

// If all of the associated values for an enumeration case are extracted as constants, or if all are extracted as variables, you can place a single var or let annotation before the case name, for brevity:

switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
  print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
  print("QR code: \(productCode).")
}


// Raw Values
// ——————————————————
// As an alternative to associated values, enumeration cases can come prepopulated with default values (called raw values), which are all of the same type.

enum ASCIIControlCharacter: Character {
  case Tab = "\t"
  case LineFeed = "\n"
  case CarriageReturn = "\r"
}

/* Note:
 ——————————————————————
 Raw values are not the same as associated values. Raw values are set to prepopulated values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumeration case is always the same. Associated values are set when you create a new constant or variable based on one of the enumeration’s cases, and can be different each time you do so.
*/


// Implicitly Assigned Raw Values
// ————————————————————————————————
// When you’re working with enumerations that store integer or string raw values, you don’t have to explicitly assign a raw value for each case. When you don’t, Swift will automatically assign the values for you.

enum AnotherPlanet: Int {
  case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum AnotherCompassPoint: String {
  case North, South, East, West
}

let earthsOrder = AnotherPlanet.Earth.rawValue
let sunsetDirection = AnotherCompassPoint.West.rawValue

print(earthsOrder)
print(sunsetDirection)

// Initializing from a Raw Value

let possiblePlanet = AnotherPlanet(rawValue: 7)
print(possiblePlanet)

let positionToFind = 11
if let somePlanet = AnotherPlanet(rawValue: positionToFind) {
  switch somePlanet {
  case .Earth:
    print("Mostly harmless")
  default:
    print("Not a safe place for humans")
  }
} else {
  print("There isn't a planet at position \(positionToFind)")
}

/* Note:
 ———————————————
 The raw value initializer is a failable initializer, because not every raw value will return an enumeration case.
*/

// Recursive Enumerations
// ————————————————————————
// A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.

//enum ArithmeticExpression {
//  case Number(Int)
//  indirect case Addition(ArithmeticExpression, ArithmeticExpression)
//  indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
//}

// You can also write indirect before the beginning of the enumeration, to enable indirection for all of the enumeration’s cases that need it:

indirect enum ArithmeticExpression {
  case Number(Int)
  case Addition(ArithmeticExpression, ArithmeticExpression)
  case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))

print(product)


func evaluate(expression: ArithmeticExpression) -> Int {
  switch expression {
  case let .Number(value):
    return value
  case let .Addition(left, right):
    return evaluate(left) + evaluate(right)
  case let .Multiplication(left, right):
    return evaluate(left) * evaluate(right)
  }
}

print(evaluate(product))
print(evaluate(sum))


























