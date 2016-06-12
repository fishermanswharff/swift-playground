//: Playground - noun: a place where people can play

import UIKit
import Foundation

enum Optional<T> { //the <T> is a generic like as in Array<T>
  case None
  case Some(T)
}

// let x: String? = nil
// same as:
// x = Optional<String>.None

// let x: String? = "hello"
// same as
// let x = Optional<String>.Some("hello")

// Optionals can be chained.

// there is an optional "defaulting" operator ??
// display.text = s ?? " "


// Tuples:

let tupleVar: (String, Int, Double) = ("hello", 5, 0.85)
let (word, number, value) = tupleVar

print(word)
print(number)
print(value)

// you can name the tuple elements
let x: (w: String, i: Int, v: Double) = tupleVar

print(x.w)
print(x.i)
print(x.v)

let (wrd, num, val) = tupleVar

//you can return multiple values from a function

func getSize() -> (weight: Double, height: Double) { return (250, 80) }

let y = getSize()

print(y.weight)
print(y.height)



// Ranges are just two endpoints. Range is generic (eg Range<T>)
// an array's range would be a Range<Int> (since arrays are indexed by Int)

//a String's range is not Int. It is Range<String.Index>
// special syntax for specifying a Range: either ... (inclusive) or ..< (open-ended)

let array = ["a","b","c","d"]
let subArray1 = array[2...3]
let subArray2 = array[2..<3]

for i in 27...104 {
  print(i)
}

print(subArray1)
print(subArray2)

//Data Structures in Swift

// classes, structs, enums

class CalculatorBrain {

}

struct Vertex {

}

enum Op {

}

// all declared the same way
// they can have properties and functions
// enums cannot have stored properties, but they can have computed properties
// all can have initializers, except enums

// Differences
// classes can inherit, they others can't.
// value type (struct, enum), vs. Reference type (class): struct and enums are passed by value, they are copied whenever you pass them around your code. Instances of classes are passed by reference, they are kept in the heap, and they are not copied.

// Value (struct and enum)

// Copied when passed as an argument to a function
// Copied when assigned to a different variable
// Immutable if assigned to a let variable
// Remember that function parameters are constants
// You must note any func that can mutate a struct/enum with the keyword mutating
// Swift lazily copies values when passed

// Reference types
// stored in the heap and reference counted (automatically)
// Constant pointers to a class (let) still can mutate by calling methods and changing properties
// NO GARBAGE COLLECTION IN SWIFT
// constant pointer to a class can mutate by calling methods and changing properties
// all "let" means is that pointer will not change.
// When passed as an argument, does not make a copy (just passing a pointer to the same instance)

// Choosing which to use?
// Usually you will choose class over struct. struct tends to be more for fundamental types.


// METHODS
//————————————————————————————

// Parameter names
//all parameters to all functions have an internal name and an external name

func foo(first: Int, externalSecond second: Double) {
  //  the internal name is the name of the local variable you use inside the method
  var sum = 0.0
  for _ in 0..<first { sum += second }
}

// the external name is what callers use when they call the method

func bar() {
  // by default _ is the first parameter, it doesn't need to named externally
  let result = foo(123, externalSecond: 5.5)
}

// it's generally "anti-swift" to force a first parameter name or supress other parameter names

// Obviously you can override methods/properties in your superclass
// precede your func or var with keyword override
// a method can be marked final which will prevent subclasses from being able to override
// Classes can also be marked final

// Both types and instances can have methods/properties

var d: Double = 0.0
// d is an instance of a Double
if d.isSignMinus {
  // isSignMinus is an instance method
  d = Double.abs(d)
  // .abs is a method of type Double
}

//you declare a type method or property with a static prefix
// static func abs(d: Double) -> Double


// PROPERTIES
// you can observe changes to any property with willSet and didSet

var someStoredProperty: Int = 42 {
  willSet { newValue }
  didSet { oldValue }
}

/*
 override var inheritedProperty {
 willSet {
 // newValue is the new Value
 }
 didSet {
 // oldValue is the old Value
 }
 }
 */


var anotherProperty: String = "hello world" {
  willSet {}
  didSet {}
}

// will also be invoked if you mutate a struct (e.g. add something to a dictionary)
// var operations: Dictionary<String, Operation> = […]

// Lazy Initialization
// a lazy property does not get init until someone accesses it
// you can allocate an object, execute a closure or call a method if you want

//lazy var brain = CalculatorBrain()
//lazy var someProperty: Type = {
//  return <the constructed value>
//}()



// Array
var a = Array<String>()
// is the same as 
var b = [1,3,4,5,6]

print(b)

let animals = ["giraffe", "cow", "doggie", "bird"]

// animals.append("ostrich") throws an error because animals is initialized with let (constant)
// if you try to access an index that doesn't exist in the array, you app with crash

// enumerating an array
for animal in animals {
  print(animal)
}

// Interesting array methods
// this one creates a new array with any undesirables filtered out
// the function passed as the argument returns false if an element is undesirable
let bigNumbers = [2,47,118,5,9].filter({$0 > 20})
print(bigNumbers)


let stringified: [String] = [1,2,3].map { String($0) }
print(stringified)

let sum: Int = [1,2,3].reduce(0) { $0 + $1 }
print(sum)


// DICTIONARY
// —————————————————————————————————
var pac10teamRankings = Dictionary<String, Int>()

pac10teamRankings = ["Stanford": 1, "Cal": 10]
let ranking = pac10teamRankings["Ohio State"]
print(ranking)

// use a tuple with for-in to enumerate a dictionary
for (key, value) in pac10teamRankings {
  print("\(key) = \(value)")
}


// STRING
//—————————————————————
/*
 string is automatically bridged to the old objective-c class NSString
 so there are some methods that you can invoke on a string that are not in String's doc. You can find them in the documentation for NSString instead. Here are some other interesting String methods:
 
 startIndex -> String.Index
 endIndex -> String.Index
 hasPrefix(String) -> Bool
 hasSuffix(String) -> Bool
 capitalizedString -> String
 lowercaseString -> String
 uppercaseString -> String
 componentsSeparatedByString(String) -> [String] // "1,2,3".csbs(",") = ["1", "2", "3"]

 string in swift is full unicode. characters are no longer single codes anymore. the simplest way to deal with the characters in a string is via this property:

*/

var characters: String.CharacterView


// NSObject
// base class of all objective-c classes
// some advanced features will require you to subclass from NSObject (and it can't hurt to do so)
// in objective-c, structs are more like C structs

// NSNumber

// NSDate used to find out the date and time right now or to store past or future dates.
// see also NSCalendar, NSDatFormatter, NSDateComponents

// NSDATA: a bag o' bits.











































