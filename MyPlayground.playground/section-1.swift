// Playground - noun: a place where people can play

import UIKit


/*  ——————————————————————————————————————————————
                      The Basics
——————————————————————————————————————————————    */

var str = "Hello, playground"
println("Hello world")

// use `let` to declare a constant, use `var` to declare a variable
var myVariable = 42
myVariable = 50
let myConstant = 42

//a constant of variable must have the same type as the value you want to assign it. however, you don't have to write the type explicitly.
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//experiment
let myFloat: Float = 4

//values are never implicitly converted to another type. if you need to convert a value to a different type, explicity make an instance of the desired type

let label = "The width is"
let width = 94
let widthLabel = label + " " + String(width)

//this gives you an unsafe pointer error
//let widthLabel = label + " " + width

//use `\(string here)` to interpolate strings
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"

//floating point calculation in string interpolation
let temp = 72.3
let difftemp = 23.4
let name = "Jason"
let mygreeting = "Hello \(name), it is \(temp - difftemp) degrees outside."

//Create arrays and dictionaries using brackets ([]) and access their elements by writing the index or key in brackets.

var shoppingList = ["catfish","water", "tulips","blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
  "Malcolm": "Captain",
  "Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"

//to create an empty array or dictionary, use the initializer syntax
let emptyArray = [String()]
let emptyDictionary = Dictionary<String, Float>()

//if type information can be inferred, you can write an empty array as `[]` and an empty dictionary as [:]—for example, when you set a new value for a variable or pass an argument to a function

shoppingList = []


/*—————————————————————————————————————————————————
              CONTROL FLOW
—————————————————————————————————————————————————*/

//use `if` and `switch` to make conditionals, and use `for-in`, `for`, `while`, and `do-while` to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required

let individualScores = [75,43,103,87,12]
var teamScore = 0
for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}
teamScore

//in an if statement, the conditional must be a Boolean, this means that code such as `if score {...}` is an error, not an implicit comparison to 0
//You can use `if` and `let` together to work with values that might be missing. These values are represented as optionals. An optional value either contains a value or contains `nil` to indicate that the value is missing. Wrie a question mark (?) after the type of a value to mark the value as optional.

var optionalString: String? = "Hello"
optionalString = nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
  greeting = "Hello, \(name)"
}


//If the optional value is nil, the conditional is false and the code in braces is skipped. Otherwise, the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.


let vegetable  = "red pepper"
switch vegetable {
  case "celery":
    let vegetableComment = "Add some raisins and make ants on a log"
  case "cucumber":
    let vegetableComment = "That would make a good tea sandwich"
  case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
  default:
    let vegetableComment = "Everything tastes good in soup"
}

//Try removing the default case. What error do you get?


//Use for-in to iterate over items in a dictionary by providing a pair of names to use for each key-value pair
let interestingNumbers = [
  "Prime":[2,3,5,7,11,13],
  "Fibonacci": [1,1,2,3,5,8],
  "Square": [1,4,9,16,25],
]

var largest = 0
var kindOfNumber: String? = ""
for(kind,numbers) in interestingNumbers {
  for number in numbers {
    if number > largest {
      largest = number
      kindOfNumber = kind
    }
  }
}

largest
kindOfNumber

//Use while to repeat a block of code until a condition changes. The condition of a loop can be at the end instead, ensuring that the loop is run at least once
var n = 2
while n < 200 {
  n = n*2
}
n

var m = 2
do {
  m = m*2
} while m < 100
m

//You can keep an index in a loop—either by using `..` to specify a range or by writing an explicit initialization, condition and increment. These two loops do the same thing:

var firstForLoop = 0
for i in 1...3 {
  firstForLoop += i
}
firstForLoop


/*  —————————————————————————————————————————————

            Functions and Closures

————————————————————————————————————————————  */

//use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses
func greet(name: String, day: String) -> String {
  return "Hello \(name), today is \(day)"
}

greet("Jason", "Wednesday")

func displayLunchSpecial(name: String, special: String) -> String {
  return "Hello, \(name), today's lunch special is \(special)"
}

displayLunchSpecial("Monica","Cod baked in Quaker State")

// use a tuple to return multiple values from a function
func getGasPrices() -> (Double, Double, Double) {
  return (3.59, 3.69, 3.79)
}
getGasPrices()


//functions can also take a variable number of arguments, collecting them into an array
func sumOf(numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum
}

sumOf()
sumOf(42,597,12)

//write a function that calculates the average of its arguments
func average(numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  return sum/numbers.count
}
average(42,597,12)

//functions can be nested. Nested functions have access to variables that were declared in the outer function. 

func returnFifteen() -> Int {
  var y = 10
  func add() {
    y += 5
  }
  add()
  return y
}
returnFifteen()

//functions are a first-class type. This means that a function can return another function as its value

func makeIncrementer() -> (Int -> Int) {
  func addOne(number: Int) -> Int {
    return 1 + number
  }
  return addOne
}

var increment = makeIncrementer()
increment(7)

//a function can take another function as one of its arguments
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
  for item in list {
    if condition(item) {
      return true
    }
  }
  return false
}

func lessThanTen(number: Int) -> Bool {
  return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(numbers, lessThanTen)

//functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed. You can write a closure without a name by surrounding the code with braces

numbers.map({
  (number: Int) -> Int in
  let result = 3 * number
  return result
})

numbers.map({
  (number: Int) -> Int in
  let result = 3 * number
  if(result % 2 != 0) {
    return 0
  } else {
    return result
  }
})

//You have several options for writing closures more concisely. When a closure's type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.

let mappedNumbers = numbers.map({
  number in 3 * number
})
mappedNumbers

//you can refer to params by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parens

let sortedNumbers = sorted(numbers){
  $0 > $1
}
sortedNumbers


/*  ——————————————————————————————————————————————————————————————————————
                                
                              Objects and Classes

——————————————————————————————————————————————————————————————————————  */

//Use `class` followed the class's name to create a class. A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way

class Shape {
  var numberOfSides = 0
  let perimeterLength = 0

  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides"
  }

  func computePerimeterLength(lengthOfSides: [Int]) -> Int {
    var sum = 0
    for item in lengthOfSides {
      sum += item
    }
    return sum
  }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
var shapePerimeter = shape.computePerimeterLength([5,5,5,5,5,5,5])

// this version of the Shape class is missing something important: an initializer to set up the class when an instance is created. Use init to create one.


class NamedShape {
  var numberOfSides: Int = 0
  var name: String

  init(name: String) {
    self.name = name
  }

  func simpleDescription() -> String {
    return "A shape with \(numberOfSides) sides"
  }

  func computePerimeterLength(lengthOfSides: [Int]) -> Int {
    var sum = 0
    for item in lengthOfSides {
      sum += item
    }
    return sum
  }
}

/*
Notice how self is used to distinguish the name property from the name argument to the initializer. 
The arguments to the initializer are passed like a function call when you create an instance of the class. 
Every property needs a value assigned—either in its declaration (as with `numberOfSides`) or in the initializer (as with `name`)
Use `deinit` to create a deinitializer if you need to perform some cleanup before the object is deallocated

Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.

Methods on a subclass that override the superclass's implementation are marked with `override`—overriding a method by accident, without `override`, is detected by the compiler as an error. The compiler also detects methods with override that don't actually override any method in the superclass.
*/

class Square: NamedShape {
  var sideLength: Double

  init(sideLength: Double, name: String) {
    self.sideLength  = sideLength
    super.init(name: name)
    numberOfSides = 4
  }

  func area() -> Double {
    return sideLength * sideLength
  }

  override func simpleDescription() -> String {
    return "A square with sides of length \(sideLength)"
  }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {

  var radius: Double

  init(radius: Double, name: String){
    self.radius = radius
    super.init(name: name)
  }

  func area() -> Double {
    return M_PI * (radius*radius)
  }

  override func simpleDescription() -> String {
    return "A circle with an area of \(area())"
  }
}

let circle = Circle(radius: 4.3, name: "my test circle")
circle.area()
circle.simpleDescription()

// In addition to simple properties that are stored, properties can have a getter and a setter

class EquilateralTriangle: NamedShape {
  var sideLength: Double = 0.0

  init(sideLength: Double, name: String){
    self.sideLength = sideLength
    super.init(name: name)
    numberOfSides = 3
  }

  var perimeter: Double {
    get {
      return 3.0 * sideLength
    }
    set {
      sideLength = newValue/3.0
    }
  }

  override func simpleDescription() -> String {
    return "An equilateral triangle with sides of length \(sideLength)"
  }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

/*
In the setter for perimeter, the new value has the implicit name `newValue`. You can provide an explicit name in parens after set. Notice that the initializer for the EquilateralTriangle class has three different steps:

1. Setting the value of properties that the subclass declares
2. Calling the superclass's initializer
3. Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point

*/




















