//: Playground - noun: a place where people can play

import UIKit

// classes and structs share a lot of similar behavior.
// Both place their entire definition within a pair of braces:
class SomeClass {
  // class definition goes here
}

struct SomeStructure {
  // structure definition goes here
}

/* Note:
 ————————————————————
  Whenever you define a new class or structure, you effectively define a brand new Swift type. Give types UpperCamelCase names (such as SomeClass and SomeStructure here) to match the capitalization of standard Swift types (such as String, Int, and Bool). Conversely, always give properties and methods lowerCamelCase names (such as frameRate and incrementCount) to differentiate them from type names.
*/

// Here’s an example of a structure definition and a class definition:
struct Resolution {
  var width = 0
  var height = 0
}

class VideoMode {
  var resolution = Resolution()
  var interlaced = false
  var frameRate = 0.0
  var name: String?
}

// The syntax for creating instances is very similar for both structures and classes:

let someResolution = Resolution()
let someVideoMode = VideoMode()

// Structures and classes both use initializer syntax for new instances. The simplest form of initializer syntax uses the type name of the class or structure followed by empty parentheses, such as Resolution() or VideoMode().

// use dot syntax to access properties of instances
print("The width of someResolution is \(someResolution.width)")

// You can drill down into sub-properties, such as the width property in the resolution property of a VideoMode:
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

// You can also use dot syntax to assign a new value to a variable property:
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// Memberwise Initializers for Structure Types
// ———————————————————————————————————————————
// All structures have an automatically-generated memberwise initializer, which you can use to initialize the member properties of new structure instances
let vga = Resolution(width: 640, height: 480)

// Unlike structures, class instances do not receive a default memberwise initializer

// Structures and enumerations are value types that are passed by value. This means that any structure and enumeration instances you create—and any value types they have as properties—are always copied when they are passed around in your code.
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

// the same applies to enumerations

enum CompassPoint {
  case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
  print("The remembered direction is still .West")
}
// Prints "The remembered direction is still .West"



/* ————————————————————————————————————————————————————
 
            Classes Are Reference Types

———————————————————————————————————————————————————— */

// Unlike value types, reference types are not copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead.

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// we assign a new constant to the instance tenEighty, which is passed by reference.
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

// tenEighty and alsoTenEighty themselves do not “store” the VideoMode instance—instead, they both refer to a VideoMode instance behind the scenes. It is the frameRate property of the underlying VideoMode that is changed, not the values of the constant references to that VideoMode.

// Identity Operators
// It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:
// identical to: ===
// not identical to: !==

if tenEighty === alsoTenEighty {
  print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}















































